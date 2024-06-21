package main

import (
	"fmt"
	"net"

	"github.com/Crade47/transms/smsproto"
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
	smsproto.RegisterTransmsServer(server, smsproto.NewTSServer())
	fmt.Printf("Listening on port %d...\n", port)
	server.Serve(listener)
}
