# gRPC
Client and server coneection for request and response in grpc

## How to run

### To Build
Run `./build.sh` script to build binaries and docker images.
The docker images will be pushed into docker hub.

### To Run
Open two terminals.
To run the server, run
```
./deploy.sh server
``` 
This will pull the server image if not exits, and run.

To run the client, run
```
./deploy.sh client
``` 
This will pull the client image if not exits, and run.

## Deploy into kubernetes
TODO:
