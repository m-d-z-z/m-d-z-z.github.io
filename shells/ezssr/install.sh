#!/bin/bash
configId=$1
accessKey=$2
if ((configId > 0)); then
  echo "running"
else
  echo "Missing configId"
  exit
fi
docker version > /dev/null || curl -fsSL get.docker.com | bash
docker run -dit --network=host --name=ezssr_$configId --log-opt max-size=50m --log-opt max-file=3 --restart=always nohair/ezssr ezssr $configId $accessKey
systemctl disable firewalld
systemctl stop firewalld
