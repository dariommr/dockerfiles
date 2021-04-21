#!/bin/bash
if [ "$1" = 'postfix' ]; then
    /etc/init.d/postfix start
    tail -f /var/log/mail.log
    exit 1;
fi
exec "$@"