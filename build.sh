# clean up
echo "clean up..."
rm -f serverd
rm -f clientd
rm -f proto/service.pb.go

# Generate/complie protobuf file
echo "generate protobuf file..."
protoc -I proto/ proto/service.proto --go_out=plugins=grpc:proto

# Build binaries
# build server
echo "build server..."
GOOS=linux go build -o serverd server/main.go
# build client
echo "build client..."
GOOS=linux go build -o clientd client/main.go

# build docker image 
# push docker imahe to docker hub

