FROM alpine:3.19

ARG PB_VERSION=0.22.21

RUN apk add --no-cache ca-certificates unzip wget && \
    wget -q -O /tmp/pb.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip && \
    unzip /tmp/pb.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/pocketbase && \
    rm -f /tmp/pb.zip

EXPOSE 8080

CMD ["sh", "-c", "/usr/local/bin/pocketbase serve --http=0.0.0.0:${PORT:-8080}"]
