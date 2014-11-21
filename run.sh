#!/bin/bash

# push logs to logging container
sed -i "s/error_log.*/error_log syslog:server=${LOGGLY_PORT_514_UDP_ADDR}:${LOGGLY_PORT_514_UDP_PORT};/" /etc/nginx/nginx.conf
sed -i "s/access_log.*/access_log syslog:server=${LOGGLY_PORT_514_UDP_ADDR}:${LOGGLY_PORT_514_UDP_PORT};/" /etc/nginx/nginx.conf
sed -i "s/pid.*//" /etc/nginx/nginx.conf

# tell nginx to stay foregrounded
echo "daemon off;" >> /etc/nginx/nginx.conf

# change server_name to noke.bit
sed -i "s/server_name.*/server_name noke.bit;/" /etc/nginx/conf.d/default.conf

# start nginx
nginx
