#!/bin/bash
if [ "`cat /etc/os-release | grep ubuntu`" == '' ]; then
yum install cmake gcc gcc-c++ git wget openssl-devel autoconf unzip -y
else
apt-get install build-essential libssl-dev autoconf unzip -y
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
