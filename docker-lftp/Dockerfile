FROM alpine:latest

RUN apk --no-cache add lftp ca-certificates openssh

COPY generate.sh /tmp/generate.sh
WORKDIR /data

ENTRYPOINT ["sh"]
CMD ["/tmp/generate.sh"]
