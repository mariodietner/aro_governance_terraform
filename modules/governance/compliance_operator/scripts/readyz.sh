#!/bin/bash
eval "$(jq -r '@sh "URL=\(.URL)"')"

while (true);
do
  # https://<master node IP address>:6443/readyz
  readyz=$(curl -ks "$URL");

  if [[ $readyz == "ok" ]]; then
    jq -n '{"readyz":"true"}'
    exit 0;
  fi

  sleep 1;
done

exit 1