#!/bin/bash

# This shell script if invoked from Terraform should be invoked through the local_exec provisioner in order to use
# the "shared connection" to Azure

echo $CLUSTER_NAME
echo $RESOURCE_GROUP
echo $API_URL

CREDS_JSON=$(az aro list-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP)
USR=$(echo $CREDS_JSON | jq -r '.kubeadminUsername')
PWD=$(echo $CREDS_JSON | jq -r '.kubeadminPassword')

echo $USR

# do not use --insecure-skip-tls-verify if you can provide certificates on the deployment time

oc login $API_URL -u $USR -p $PWD --insecure-skip-tls-verify
oc patch operatorhub cluster --insecure-skip-tls-verify --type=merge \
  -p '{
    "spec": {
      "disableAllDefaultSources": false,
      "sources": [
        {"name": "certified-operators", "disabled": false},
        {"name": "community-operators", "disabled": false},
        {"name": "redhat-marketplace", "disabled": false},
        {"name": "redhat-operators", "disabled": false}
      ]
    }
  }'
oc apply -f ../manifests/namespace.yaml --insecure-skip-tls-verify
oc apply -f ../manifests/operator_group.yaml --insecure-skip-tls-verify
oc apply -f ../manifests/subscription.yaml --insecure-skip-tls-verify

sleep 5

INSTALL_PLAN=$(oc get subscription compliance-operator-sub --insecure-skip-tls-verify -n openshift-compliance -o jsonpath='{.status.installplan.name}')

for i in {1..100}; do
  echo "checking compliance-operator operator installation-$i"

  OPERATOR_STATUS=$(oc get installplan "$INSTALL_PLAN" -n openshift-compliance -o jsonpath='{.status.phase}' 2>/dev/null)
  if [ "$OPERATOR_STATUS" = "Complete" ]; then
      echo "compliance-operator installed successfully"
      break
  fi

  sleep 3

done

oc apply -f ../manifests/scanSettingBinding.yaml --insecure-skip-tls-verify