FROM node

RUN apt-get update && apt-get install nginx curl -y

RUN curl -qL https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-linux-amd64 -o /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/conf\.d && \
    mkdir -p /etc/confd/templates

COPY . /src

RUN cp /src/confd/nginx\.toml /etc/confd/conf\.d/nginx\.toml && \
    cp /src/confd/nginx\.tmpl /etc/confd/templates/nginx\.tmpl && \
    rm /etc/nginx/sites-enabled/default && \
    rm /etc/nginx/nginx\.conf && \
    cp /src/nginx\.conf /etc/nginx/nginx\.conf

RUN cp /src/confd.sh /usr/local/bin/confd-watch && \
    chmod +x /usr/local/bin/confd-watch
