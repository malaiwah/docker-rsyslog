# docker-rsyslog
A simple container to collect remote syslogs on traditionnal ports udp and tcp 514, to files in /var/log/remote.
Logs are rotated every hour, compressed and kept for 72 hours.

docker run -it --rm -p 514:514 -p 514:514/udp -p 9001:9001 -v /mnt/syslog/`hostname`:/var/log/remote malaiwah/rsyslog-receiver

TCP/514: TCP Syslog
UDP/514: UDP Syslog
TCP/9001: Supervisord HTTP port -- keep it secure
