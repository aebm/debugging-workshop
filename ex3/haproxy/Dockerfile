FROM alpine
COPY haproxy /usr/local/bin/
COPY haproxy.conf /etc/haproxy.conf
RUN apk add strace binutils
EXPOSE 80
ENTRYPOINT ["/usr/local/bin/haproxy", "-f", "/etc/haproxy.conf"]
