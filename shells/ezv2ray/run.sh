#!/bin/bash
v2ray_realpath=$(readlink -f v2ray)
cfg_realpath=$(readlink -f cfg.json)
v2ray_pid=$(ps ux | grep "$(readlink -f v2ray)" | grep -v grep | awk '{print $2}')
if [ ! $v2ray_pid ];
then
    echo 'Starting V2Ray'
else
    echo 'Restarting V2Ray (pid:'$v2ray_pid')'
    kill -9 $v2ray_pid
fi
configId=$1
accessKey=$2

nohup $(readlink -f v2ray) --config=https://www.x-air.icu/api/hostedConfig/$configId/\?key=$accessKey >> /dev/null 2>&1 &
echo 'Preparing...'
sleep 1

v2ray_pid=$(ps ux | grep "$(readlink -f v2ray)" | grep -v grep | awk '{print $2}')

if [ ! $v2ray_pid ];
then
    echo -e "\033[31m***Fail to start V2Ray***\033[0m"
else
    echo -e "\033[32mSuccess to start V2Ray (pid:'$v2ray_pid')\033[0m"
fi
