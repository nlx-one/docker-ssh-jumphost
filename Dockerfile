FROM alpine:latest
MAINTAINER Nick Groenen <docker@nick.groenen.me>

RUN apk add --no-cache openssh-server && adduser -s /bin/ash -D -h /home/ssh ssh && install -d -o ssh -g ssh -m 0700 /home/ssh/.ssh

USER ssh
CMD ["/bin/sh", "-c", "ssh-keygen -A && exec /usr/sbin/sshd -D"]
VOLUME /etc/ssh/
VOLUME /home/ssh/.ssh
