package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	pb "../proto"
	"google.golang.org/grpc"
)

var (
	ctx      = context.Background()
	greeting = "hello"
)

func main() {
	address := os.Getenv("GRPC_SERVER") + ":50051"
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	fmt.Println("Connected with server...")
	c := pb.NewHellooClient(conn)

	if len(os.Args) > 1 && strings.TrimSpace(os.Args[1]) != "" {
		greeting = os.Args[1]
	}
	sayHello(c)
	for range time.Tick(5 * time.Second) {
		sayHello(c)
	}
}

func sayHello(c pb.HellooClient) {
	r, err := c.SayHello(ctx, &pb.HelloRequest{Name: greeting})
	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	fmt.Println(r.Message)
}
