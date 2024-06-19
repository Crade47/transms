build:
	@go build -o ./bin/server_transms

run:build
	@./bin/server_transms


genCode:

	@protoc --go_out=./models/ --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative ./models/*.proto

test:
	@go test -v ./...