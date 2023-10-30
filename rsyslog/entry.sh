#!/bin/bash
cp /rsyslog-ca.pem /etc/rsyslog-ca-cert.pem
cp /rsyslog-ca.pem /etc/rsyslog-cert.pem
cp /rsyslog-ca.key /etc/rsyslog-key.key

if [ "$TYPE" == "server" ]
then
    cat /tcp_tls.conf >>/etc/rsyslog.conf
fi

if [ "$TYPE" == "client" ]
then
    mkdir /data 
    touch /data/error.log
    sed -i "s/<SERVER>/$SERVER/g" /imfile_tls.conf
    sed -i "s/<PORT>/$PORT/g" /imfile_tls.conf
    cat /imfile_tls.conf >>/etc/rsyslog.conf
fi

/usr/sbin/rsyslogd -n