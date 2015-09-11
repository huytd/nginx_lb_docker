##Overview

Docker nginx container, meant to be used within a coreos cluster. Uses confd to watch for host machine's etcd key changes.
<br>
Watches for '/services/app', assumes app is a list of apps with the value being the IP:PORT

```
docker pull esayemm/nginx_lb
docker run --name nginx -p 80:80 -e HOST_IP=<Host IP> -v /etc/nginx/sites-enabled:/etc/nginx/conf.d -v /etc/nginx/certs-enabled:/etc/nginx/certs -v /var/log/nginx:/var/log/nginx esayemm/nginx_lb /usr/bin/confd-watch
```
