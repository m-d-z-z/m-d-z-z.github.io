#!/bin/bash
dhclient -r -v
rm -rf /var/lib/dhclient/dhclient.leases
ps aux |grep dhclient |grep -v grep |awk -F ' ' '{print $2}' | xargs kill -9 2>/dev/null
sleep 5s
dhclient -v
