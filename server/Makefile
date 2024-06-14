build:
	@go build -o ./bin/server_transms

run:build
	@./bin/server_transms


protoModels:

	@protoc --go_out=./models/ ./models/*.proto

test:
	@go test -v ./...