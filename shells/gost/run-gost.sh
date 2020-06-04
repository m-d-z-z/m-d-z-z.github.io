#!/bin/bash
gostaddr=1.1.1.1:8888
target=1.1.1.1:8080
listen=:8080

#server
#./gost -L relay+mtls://$gostaddr/$target

#client
./gost -L tcp://$listen -F relay+mtls://$gostaddr
