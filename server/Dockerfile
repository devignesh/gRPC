FROM alpine:latest

LABEL app="grpc_server"
LABEL version="0.0.1"
LABEL description="grpc server image"

RUN mkdir -p /app && apk update && apk add --no-cache ca-certificates
WORKDIR /app

COPY grpc_server /app


CMD /app/grpc_server
# ENTRYPOINT ["grpc_server"]
# EXPOSE 50051
