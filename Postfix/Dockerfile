FROM ubuntu

# Install Postfix.
RUN apt-get update && \
    apt-get install -q -y postfix

#Configure Postfix
COPY main.cf /etc/postfix/
COPY thawte_Primary_Root_CA.pem /etc/ssl/certs/
COPY sasl_passwd /etc/postfix/
RUN touch /var/log/mail.log && \
    postmap /etc/postfix/sasl_passwd

#RUN Postfix
EXPOSE 25
COPY entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
CMD ["postfix"]
