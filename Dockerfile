FROM alpine:3.19

ARG PB_VERSION=0.22.21

RUN apk add --no-cache ca-certificates unzip wget && \
    wget -q https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip && \
    unzip pocketbase_${PB_VERSION}_linux_amd64.zip && \
    chmod +x pocketbase && \
    rm pocketbase_${PB_VERSION}_linux_amd64.zip

WORKDIR /app

EXPOSE 8080

CMD ["sh", "-c", "./pocketbase serve --http=0.0.0.0:${PORT:-8080}"]
