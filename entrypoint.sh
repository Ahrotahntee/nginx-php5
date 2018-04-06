#!/bin/ash
nginx -g "daemon off;" &
PID="$!"
php-fpm5 -F &
PID="$PID $!"
trap "kill -INT $PID" SIGINT
trap "kill -ALRM $PID" SIGALRM
trap "kill -HUP $PID" SIGHUP
trap "kill -USR1 $PID" SIGUSR1
trap "kill -USR2 $PID" SIGUSR2
trap "kill -WINCH $PID" SIGWINCH
wait $PID
