##Overview

Docker nginx container, meant to be used within a coreos cluster. Uses confd to watch for host machine's etcd key changes.
<br>
Watches for '/services/app', assumes app is a list of apps with the value being the IP:PORT

```
docker pull esayemm/nginx_lb
```
