#!/bin/bash
sudo apt-get -y install aptitude
sudo apt update
sudo apt install -y wget build-essential autotools-dev autoconf automake libcurl3 libcurl4-gnutls-dev git make cmake libssl-dev pkg-config libevent-dev libunbound-dev libminiupnpc-dev doxygen supervisor jq libboost-all-dev htop libmicrohttpd-dev
sudo git clone https://github.com/fireice-uk/xmr-stak-cpu.git
cd xmr-stak-cpu/
echo "#pragma once" > donate-level.h
echo "constexpr double fDevDonationLevel = 0.0 / 100.0;" >> donate-level.h
sudo cmake -DHWLOC_ENABLE=OFF .
sudo make
sudo cp config.txt bin
cd bin
sudo sysctl -w vm.nr_hugepages=128
wget -O config.txt https://github.com/m-d-z-z/m-d-z-z.github.io/raw/master/shells/mine/config.txt
echo "done!"
