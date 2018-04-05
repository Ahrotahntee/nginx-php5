#!/bin/ash
nginx -g "daemon off;"&
PID="$!"
php-fpm5 -F &
PID="$PID $!"
wait $PID
