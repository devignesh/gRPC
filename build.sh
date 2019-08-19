#! /bin/bash

# clean up
echo "clean up..."
rm -f serverd
rm -f clientd
rm -f proto/service.pb.go

export CGO_ENABLED=0

# Generate/complie protobuf file
echo "generate protobuf file..."
protoc -I proto/ proto/service.proto --go_out=plugins=grpc:proto

# Build binaries
# build server
echo "build server..."
go build -ldflags '-w -s' -o server/grpc_server server/main.go
# build client
echo "build client..."
go build -ldflags '-w -s' -o client/grpc_client client/main.go

# build docker image 
docker build -t devignesh/grpc_server:latest server/.

docker build -t devignesh/grpc_client:latest client/.
# push docker imahe to docker hub
echo "Pushing images to docker hub..."
docker push devignesh/grpc_server:latest
docker push devignesh/grpc_client:latest