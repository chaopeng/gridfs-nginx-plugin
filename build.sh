#!/bin/bash
# chao@2014-11-19 11:54:17

cd ../nginx
./configure --add-module=../gridfs-nginx-plugin --with-cc-opt="-Wno-sign-compare"
make -j8

