#!/bin/bash
if [ "`cat /etc/os-release | grep centos`" == '' ]; then
apt-get install build-essential libssl-dev autoconf unzip -y
else
yum install cmake gcc gcc-c++ git wget openssl-devel autoconf automake unzip -y
fi

wget -O n2n.zip https://github.com/ntop/n2n/archive/2.8.zip
unzip n2n.zip
rm -rf n2n.zip
cd n2n-2.8
./autogen.sh
./configure
make && make install
cd ..
rm -rf n2n-2.8
