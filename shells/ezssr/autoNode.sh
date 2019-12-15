#!/bin/bash
echo "1"> /tmp/autonode.install.auto
echo $1>> /tmp/autonode.install.auto
echo $2>> /tmp/autonode.install.auto
echo $3>>/tmp/autonode.install.auto
echo $5>>/tmp/autonode.install.auto
echo $4>>/tmp/autonode.install.auto
wget -O node.sh -N --no-check-certificate https://raw.githubusercontent.com/tonydan6324/ssrmu/manyuser/node.sh && chmod +x node.sh && ./node.sh < /tmp/autonode.install.auto
systemctl start ssr
systemctl enable ssr
rm -rf /tmp/autonode.install.auto
