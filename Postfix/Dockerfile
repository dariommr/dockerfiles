FROM ubuntu

# Install Postfix.
RUN apt-get update && \
    apt-get install -q -y postfix

#Configure Postfix
COPY root-ca.pem /etc/ssl/certs/
COPY config_postfix.sh /

#RUN Postfix
EXPOSE 25
COPY entry.sh /
RUN chmod +x /entry.sh && chmod +x /config_postfix.sh
ENTRYPOINT ["/entry.sh"]
CMD ["postfix"]
