#!/bin/bash

/etc/init.d/postgresql stop
/etc/init.d/mysql      stop
/etc/init.d/rsync      stop
/etc/init.d/ssh        stop
/etc/init.d/nis        stop
/etc/init.d/postfix    stop
/etc/init.d/rpcbind    stop
/etc/init.d/cron       stop
/etc/init.d/ntp        stop
/etc/init.d/rsyslog    stop

