# syntax=docker/dockerfile:1

FROM golang:1.17-buster
WORKDIR /app
COPY *.go makefile ./
COPY net ./net
COPY command ./command
COPY x509 ./x509

RUN go mod init github.com/pbergman/graylog-proxy && \
    go mod tidy && \
    go build -o /usr/sbin/graylog-proxy main.go && \
    strip /usr/sbin/graylog-proxy

CMD [ "/usr/sbin/graylog-proxy" ]
