# This shell script if invoked from Terraform should be invoked through the local_exec provisioner in order to use
# the "shared connection" to Azure

CREDS_JSON=$(az aro list-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP)
USERNAME=$CREDS_JSON | jq '.kubeadminUsername'
PASSWORD=$CREDS_JSON | jq '.kubeadminPassword'

oc login $API_URL -u $USERNAME -p $PASSWORD
oc apply -f ./manifests