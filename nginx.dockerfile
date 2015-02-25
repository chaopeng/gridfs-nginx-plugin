#
# Tengine dockerfile base CentOS:latest
# plugins:
#   - nginx-md5
#   - nginx-gridfs  

FROM centos:latest
MAINTAINER Chao<chaopeng@chaopeng.me>

WORKDIR ~

RUN yum -y update
RUN yum -y install git gcc make openssl-devel pcre-devel
RUN git clone https://github.com/alibaba/tengine.git

# nginx-gridfs
RUN git clone https://github.com/chaopeng/gridfs-nginx-plugin.git
RUN cd gridfs-nginx-plugin && \
  git submodule init && \
  git submodule update

RUN cd tengine && \
./configure  --with-cc-opt="-Wno-sign-compare -Wno-unused-variable" \
 --conf-path=/etc/nginx/nginx.conf \
 --with-http_ssl_module \
 --with-http_flv_module \
 --with-http_gzip_static_module \
 --add-module=../gridfs-nginx-plugin \
&& \
make -j8 && \
make install


CMD ["/usr/local/nginx/sbin/nginx"]

EXPOSE 80
EXPOSE 443

