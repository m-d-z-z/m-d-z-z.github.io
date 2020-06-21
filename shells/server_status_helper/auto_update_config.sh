#!/bin/bash
wget -O /usr/local/ServerStatus/server/config.tmp https://gkd.wdnmd.app/api/hostedConfig/xxxxxxx?key=xxxxxx
has=`grep servers /usr/local/ServerStatus/server/config.tmp`
if [ -n "$has" ]; then
    oldmd5=`md5sum < /usr/local/ServerStatus/server/config.json`
    newmd5=`md5sum < /usr/local/ServerStatus/server/config.tmp`
    if [ "$oldmd5" != "$newmd5" ];then
        cat /usr/local/ServerStatus/server/config.tmp > /usr/local/ServerStatus/server/config.json
        cd /root && bash status.sh s < .restart.input
    fi
    rm -rf /usr/local/ServerStatus/server/config.tmp
fi
