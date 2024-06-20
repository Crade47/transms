build:
	@go build -o ./bin/server_transms
run:build
	@./bin/server_transms
proto:
	@protoc --go_out=smsproto --go_opt=paths=source_relative --go-grpc_out=smsproto --go-grpc_opt=paths=source_relative smsproto.proto
test:
	@go test -v ./...