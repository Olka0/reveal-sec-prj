FROM alpine:latestRUN apk update && apk upgrade
RUN apk add bash
RUN apk add nginx
RUN apk add php8 php8-fpm php8-opcache
RUN apk add php8-gd php8-zlib php8-curlCOPY server/etc/nginx /etc/nginx
COPY server/etc/php /etc/php8
COPY src /usr/share/nginx/htmlRUN mkdir /var/run/phpEXPOSE 80
EXPOSE 443STOPSIGNAL SIGTERMCMD ["/bin/bash", "-c", "php-fpm8 && chmod 777 /var/run/php/php8-fpm.sock && chmod 755 /usr/share/nginx/html/* && nginx -g 'daemon off;'"]
