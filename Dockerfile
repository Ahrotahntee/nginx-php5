FROM alpine:latest
RUN apk update && apk add nginx php5-fpm && mkdir /run/nginx && mkdir /run/php && chmod 777 -R /run 
VOLUME /etc/nginx
VOLUME /etc/php/7.0/
EXPOSE 80/tcp
ADD default.conf /etc/nginx/conf.d/default.conf
ADD www.conf /etc/php5/fpm.d/www.conf
ADD php-fpm.conf /etc/php5/php-fpm.conf
ADD entrypoint.sh /sbin/entrypoint.sh
RUN ln -s /dev/stdout /var/log/nginx/access.log
RUN ln -s /dev/stderr /var/log/nginx/error.log
RUN ln -s /dev/stdout /var/log/php-fpm.log
ENTRYPOINT ["/sbin/entrypoint.sh"]
