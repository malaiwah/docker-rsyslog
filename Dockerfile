FROM alpine:latest

RUN apk add --no-cache \
      rsyslog \
      rsyslog-tls \
      logrotate \
      supervisor \
      dcron

COPY ./logrotate /etc/periodic/hourly/
COPY ./rsyslog /etc/logrotate.d
COPY ./logrotate.conf /etc/

COPY ./rsyslog.conf /etc/
COPY ./01_omfile.conf /etc/rsyslog.d/
COPY ./10_imudp.conf /etc/rsyslog.d/
COPY ./10_imtcp.conf /etc/rsyslog.d/

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 514/tcp
EXPOSE 514/udp
