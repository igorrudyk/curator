# curator
This only job executed by the docker built from this repository is to clean the elastic search logstash history leaving only a configurable amount of days worth of logging in the system. The job runs in the specified interval.

It can be run as follows:

docker run --restart=always -d --net elasticsearch  
-e 'INTERVAL_IN_HOURS=${CURATOR_INTERVAL_IN_HOURS}' \ 
-e 'OLDER_THAN_IN_DAYS=${CURATOR_OLDER_THAN_IN_DAYS}' \
-e 'LIMIT_DISK_SPACE=${CURATOR_LIMIT_DISK_SPACE}' \
--name curator 
igorrudyk1/curator:${CURATOR_PACKAGE_VERSION}


INTERVAL_IN_HOURS: The amount of time between two curator runs
OLDER_THAN_IN_DAYS: Indicates all logs with a date exceeding this age can be deleted.
LIMIT_DISK_SPACE: limit disk space
