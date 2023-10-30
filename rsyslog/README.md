# RSyslog Client and Server for testing purposes
## Building the image
```shell
docker build -t rsyslog .
```

## Prepare the environment
```shell
docker network create syslog-net
```

## Run the server
```shell
docker run -d --cap-add SYSLOG --restart always -e TYPE=server -p 6514:6514 -h rsyslog-server --network=syslog-net --name rsyslog-server rsyslog
```

## Run the client
```shell
docker run -d --cap-add SYSLOG --restart always -e TYPE=client -e SERVER=rsyslog-server -e PORT=6514 -h rsyslog-client --network=syslog-net --name rsyslog-client rsyslog
```

If you need to specify a CA certificate, please run it this way:
```shell
docker run -d --cap-add SYSLOG --restart always -v /path/to/my-cert.pem:/rsyslog-ca.pem -e TYPE=client -e SERVER=rsyslog-server -e PORT=6514 -h rsyslog-client --network=syslog-net --name rsyslog-client rsyslog
```