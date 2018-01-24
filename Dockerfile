FROM nginx:mainline-alpine
LABEL maintainer="Robin Liu <yixuan.liu@cba.com.au>"

WORKDIR /etc/nginx

RUN mkdir -p /var/nginx
RUN rm -rf nginx.conf conf.d/default.conf

ADD conf/nginx.conf nginx.conf
ADD conf/conf.d conf.d/

RUN envsubst '$API_HOST $API_PORT' < conf.d/parity-api.conf > conf.d/parity-api.conf

RUN cat conf.d/parity-api.conf

CMD [ "/usr/sbin/nginx" ]