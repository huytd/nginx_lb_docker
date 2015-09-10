FROM node

RUN apt-get update && apt-get install nginx curl -y

RUN curl -qL https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-linux-amd64 -o /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/{conf.d,templates}

COPY . /src

RUN cp /src/confd/nginx\.toml /etc/confd/conf\.d && \
    cp /src/confd/nginx\.tpml /etc/confd/templates && \
    rm /etc/nginx/sites-enabled/default

RUN cp /src/confd.sh /usr/local/bin/confd-watch && \
    chmod +x /usr/local/bin/confd-watch
