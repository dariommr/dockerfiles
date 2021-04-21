# Postfix Relay server through gmail (Dockerfile)
This dockerfile is intended to be use as relay server for Gmail.

Prerequisites:
- Docker installed, even in a VM or Desktop
- Configure Gmail account to allow `unsecure` Apps
- Configure Gmail to allow POP3 and IMAP

Customizations
In `main.cf` file:
```
mynetworks = 127.0.0.1/32 172.17.0.0/24 10.10.10.0/24 <--- The networks allowed to send emails through the relay
```
`127.0.0.1/32`: The localhost
`172.17.0.0/24`: The docker network
`10.10.10.0/24`: The local network

Download the following certificate: https://www.thawte.com/roots/thawte_Primary_Root_CA.pem

**Note**:Put the all the files in the same folder.

## BUILD THE IMAGE AND ENJOY