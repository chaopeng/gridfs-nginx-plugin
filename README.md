gridfs-nginx-plugin
===================

gridfs-nginx plugin that works for real!!

This is a fork from [barakav/gridfs-nginx-plugin](https://github.com/barakav/gridfs-nginx-plugin)

I provide this from our company's development department
after compiling and bug fixing in all of the components in this project.

Nginx 1.7.7 and Nginx-Gridfs Installation
===================================

1. make, go to the workspace & run: 
`curl https://raw.githubusercontent.com/chaopeng/gridfs-nginx-plugin/master/install.sh | bash`

2. install: 
```{bash}
cd nginx-dev/nginx
make install
```
OR copy the nginx-dev/nginx/objs/nginx to replace your installed nginx

3. Now your Nginx + Nginx-Gridfs is installed under: 
/usr/local/nginx - *the folder of all nginx folders*
/usr/local/nginx/sbin/nginx - *the nginx executable*

Make Nginx as Linux service
===========================
1. Add the service in /etc/init.d by: 
`sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx`
2. Make sure nginx is execute file by: 
`chmod +x /etc/init.d/nginx`
3. Now you can use: 
  `service nginx start`
  `service nginx stop`
  `service nginx restart`


Configure Nginx to work with MongoDB Girdfs
===========================================
1. Open nginx.conf by: 
`nano /usr/local/nginx/conf/nginx.conf`
2. Add the following lines: 
	
	`server {`
		`listen 80;`
		`server_name <your url>;` 
		`location /<choose url>/ {`
		`gridfs <db-name>`
			`field=_id`
			`type=objectid`
			`user=<db username>`
			`pass=<db password>;`
		`mongo 127.0.0.1:27017;`
		`}`
	`}`

3. Restart nginx by: 
`service nginx restart`

