FROM        alpine:3.13

RUN         apk update && \
            apk add nginx openssl && \
            wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
            chmod 777 /usr/bin/dumb-init && \
            mkdir -p /etc/nginx/tls /var/run/nginx && \
	    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/tls/fchanane.42.fr.crt -keyout /etc/nginx/tls/fchanane.42.fr.key -subj "/C=Mr/ST=Bg/L=Bg/O=1337/OU=1337/CN=fchanane.42.fr" && \
            rm -rf /etc/nginx/conf.d/default.conf

COPY        conf/nginx.conf /tmp/nginx.conf
COPY        tools/script.sh /tmp/script.sh

RUN         chmod 777 /tmp/script.sh

EXPOSE      443

ENTRYPOINT  [ "/usr/bin/dumb-init", "--" ]

CMD         [ "sh", "-c", "/tmp/script.sh" ]
