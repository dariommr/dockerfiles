FROM ubuntu
RUN apt update && apt install rsyslog rsyslog-gnutls -y
COPY imfile_tls.conf /
COPY tcp_tls.conf /
COPY rsyslog-ca.key /
COPY rsyslog-ca.pem /
COPY entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]