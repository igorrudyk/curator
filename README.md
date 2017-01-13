# curator
This only job executed by the docker built from this repository is to clean the elastic search logstash history leaving only a configurable amount of days worth of logging in the system. The job runs in the specified interval.

It can be run as follows:

docker run --restart=always -d --log-opt max-size=256M --log-opt max-file=1
-e 'INTERVAL_IN_HOURS=${CURATOR_INTERVAL_IN_HOURS}' \ 
-e 'OLDER_THAN_IN_DAYS=${CURATOR_OLDER_THAN_IN_DAYS}' \
-e 'ES_HOST=172.19.0.100' \
-e 'ES_PORT=9200' \
--name curator 
igorrudyk1/curator:3.5.1


INTERVAL_IN_HOURS: The amount of time between two curator runs
OLDER_THAN_IN_DAYS: Indicates all logs with a date exceeding this age can be deleted.
LIMIT_DISK_SPACE: limit disk space
