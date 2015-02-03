FROM nginx
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
ENV DEBIAN_FRONTEND noninteractive
ENV KIBANA_VERSION 3.1.0
ADD https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz /tmp/kibana.tar.gz
RUN tar -zxC / -f /tmp/kibana.tar.gz \
  && rm /tmp/kibana.tar.gz \
  && mv /kibana-$KIBANA_VERSION /kibana
ADD config.js /kibana/config.js
ADD start.sh /usr/local/bin/start.sh
ADD kibana.conf /etc/nginx/conf.d/default.conf
EXPOSE 8004
ENTRYPOINT ["/usr/local/bin/start.sh"]
CMD []
ENV GIT_COMMIT unknown
