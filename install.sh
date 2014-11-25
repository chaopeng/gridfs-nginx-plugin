#!/bin/bash

mkdir nginx-dev
cd nginx-dev

git clone https://github.com/nginx/nginx.git
git clone https://github.com/chaopeng/gridfs-nginx-plugin.git

cd gridfs-nginx-plugin
./build.sh
