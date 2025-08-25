#!/bin/bash
eval "$(jq -r '@sh "URL=\(.URL)"')"

while (true);
do
  # https://<master node IP address>:6443/readyz
  readyz=$(curl -ks "$URL");

  if [[ $readyz == "ok" ]]; then
    jq -n '{"ready":"true"}'
    exit 0;
  fi

  sleep 2;
done

jq -n '{"ready":"false"}'
exit 1