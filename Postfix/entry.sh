#!/bin/bash
if [ "$1" = 'postfix' ]; then
    # Run the configuration Script
    /config_postfix.sh
    /etc/init.d/postfix start
    tail -f /var/log/mail.log
    exit 1;
fi
exec "$@"
