#!/bin/bash
# Initializing the log file
touch /var/log/mail.log
touch /etc/mailname

# Creating the credentials file
echo "[$MY_SMTP]:$MY_PORT $MY_EMAIL:$MY_PASS" >/etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
rm -f /etc/postfix/sasl_passwd

# Getting the networks
MY_SUBNET=$(hostname -I | cut -d"." -f1-3)".0/24 127.0.0.1/32"
MY_NETWORKS=$MY_SUBNET" "$MY_NETWORKS

# Configuring main.cf
add_config () {
    CONFIG_FILE=/etc/postfix/main.cf
    if grep -q $1 $CONFIG_FILE; then
        VALUE="$(echo $2 | sed 's|\/|\\/|g')"
        sed -i "s/^$1.*/$1 = $VALUE/g" $CONFIG_FILE
    else
        echo "$1 = $2" >>$CONFIG_FILE
    fi
}

add_config 'mynetworks' "$MY_NETWORKS"
add_config 'myhostname' $(hostname)
add_config 'myhostname' $(hostname)
add_config 'relayhost' "[$MY_SMTP]:$MY_PORT"
add_config 'compatibility_level' '2'
add_config 'inet_protocols' 'ipv4'
add_config 'maillog_file' '/var/log/mail.log'
add_config 'smtp_sasl_auth_enable' 'yes'
add_config 'smtp_sasl_password_maps' 'hash:/etc/postfix/sasl_passwd'
add_config 'smtp_sasl_security_options' 'noanonymous'
add_config 'smtp_tls_CAfile' '/etc/ssl/certs/root-ca.pem'
add_config 'smtp_use_tls' 'yes'
add_config 'smtp_sasl_tls_security_options' 'noanonymous'
