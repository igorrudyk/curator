FROM alpine:3.3

RUN apk --update add python py-pip && \
    pip install elasticsearch-curator==3.5.0 && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

ENV INTERVAL_IN_HOURS=2
ENV OLDER_THAN_IN_DAYS="14"
ENV LIMIT_DISK_SPACE="20"
ENV ES_HOST=172.19.0.100

CMD while true; do curator --host $ES_HOST delete indices --older-than $OLDER_THAN_IN_DAYS --time-unit=days --timestring '%Y.%m.%d'; curator --host $ES_HOST delete --disk-space $LIMIT_DISK_SPACE indices --all-indices; sleep $(( 60*60*INTERVAL_IN_HOURS )); done
