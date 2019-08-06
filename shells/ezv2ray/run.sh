#!/bin/bash
configId=$1
accessKey=$2
checkFlag=$3
v2ray_realpath=$(readlink -f v2ray)
cfg_realpath=$(readlink -f cfg.json)
v2ray_pid=$(ps ux | grep "$(readlink -f v2ray) --config=https://www.x-air.icu/api/hostedConfig/$configId/?key=$accessKey" | grep -v grep | awk '{print $2}')
v2rayFile="./v2ray"
v2ctlFile="./v2ctl"
if [ ! -e "$v2rayFile" || ! -e "$v2ctlFile" ]; then
    echo '错误： 本脚本依赖的核心文件 v2ray 和 v2ctl 不存在'
    exit
fi
if [ ! -x "$v2rayFile" || ! -x "$v2ctlFile" ]; then
    echo '错误：本脚本依赖的核心文件 v2ray 和 v2ctl 没有运行权限'
    exit
fi
if [ ! $v2ray_pid ]; then
    echo '正在启动 V2Ray'
    nohup $(readlink -f v2ray) --config=https://www.x-air.icu/api/hostedConfig/$configId/?key=$accessKey >>/dev/null 2>&1 &
else
    if [ $flag ]; then
        echo "V2ray 已经运行 (pid: $v2ray_pid)，请享用～."
    else
        echo '正在重启 V2Ray (pid:'$v2ray_pid')'
        kill -9 $v2ray_pid
        nohup $(readlink -f v2ray) --config=https://www.x-air.icu/api/hostedConfig/$configId/?key=$accessKey >>/dev/null 2>&1 &
        echo 'Preparing...'
        sleep 1

        v2ray_pid=$(ps ux | grep "$(readlink -f v2ray)" | grep -v grep | awk '{print $2}')

        if [ ! $v2ray_pid ]; then
            echo -e "\033[31m***V2ray重启失败，可能是配置文件出错或者端口被占用，请检查***\033[0m"
        else
            echo -e "\033[32mV2ray启动成功 (pid:'$v2ray_pid')\033[0m"
        fi
    fi
fi
