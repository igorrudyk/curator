FROM alpine:3.3
MAINTAINER Igor Rudyk <rudyk.igor@gmail.com>

RUN apk --update add python py-pip && \
    pip install elasticsearch-curator==3.5.1 && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

ENV INTERVAL_IN_HOURS=6
ENV OLDER_THAN_IN_DAYS="14"
ENV LIMIT_DISK_SPACE="20"
ENV ES_HOST=172.19.0.100
ENV ES_PORT=9200

CMD while true; do curator --host $ES_HOST --port $ES_PORT delete indices --older-than $OLDER_THAN_IN_DAYS --time-unit=days --timestring '%Y.%m.%d'; sleep $(( 60*60*INTERVAL_IN_HOURS )); done
