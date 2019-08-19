FROM alpine:latest

LABEL app="grpc_client"
LABEL version="0.0.1"
LABEL description="grpc client image"

RUN mkdir -p /app && apk update && apk add --no-cache ca-certificates
WORKDIR /app

COPY grpc_client /app

ENV GRPC_SERVER 172.17.0.2
CMD /app/grpc_client

#EXPOSE 80

#CMD ./grpc_client