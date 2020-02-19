FROM quay.io/mongodb/charts:19.12.1

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/default.conf

RUN touch /var/run/nginx.pid && \
  chown -R www-data:www-data /var/run/nginx.pid && \
  chown -R www-data:www-data /var/cache/nginx

RUN chown -R www-data:www-data /mongodb-charts/logs

RUN mkdir /mongodb-charts/volumes/keys
RUN mkdir /mongodb-charts/volumes/db-certs
RUN mkdir /mongodb-charts/volumes/logs

RUN chown -R www-data:www-data /mongodb-charts/volumes

RUN chown -R www-data:www-data /mongodb-charts/config

RUN chown -R www-data:www-data /usr/share/nginx/html/
RUN touch /supervisord.log
RUN chown -R www-data:www-data /supervisord.log

USER www-data

CMD ["/bin/sh","-c","/usr/bin/node /mongodb-charts/bin/charts-cli.js startup"]
