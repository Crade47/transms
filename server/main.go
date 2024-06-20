package main

import (
	"fmt"
	"net"

	pb "github.com/Crade47/transms/smsproto"
	"google.golang.org/grpc"
)

func main() {
	port := 7890
	//listen on port
	listener, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", port))
	if err != nil {
		panic(fmt.Sprintf("Error listening on port, %v", err))
	}
	var opts []grpc.ServerOption
	server := grpc.NewServer(opts...)
	pb.RegisterTransmsServer(server, pb.NewTSServer())
	server.Serve(listener)
}
