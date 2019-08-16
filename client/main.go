package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	pb "../proto"
	"google.golang.org/grpc"
)

const (
	address     = "localhost:50051"
	defaultName = "hello"
)

func main() {
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewHellooClient(conn)

	name := defaultName
	if len(os.Args) > 1 {
		name = os.Args[1]
	}

	ctx := context.Background()
	for range time.Tick(5 * time.Second) {
		r, err := c.SayHello(ctx, &pb.HelloRequest{Name: name})
		if err != nil {
			log.Fatalf("could not greet: %v", err)
		}
		fmt.Println(r.Message)
	}
}
