PACKAGE = github.com/fekuna/golang-grpc-blog
BIN_DIR = bin
PROTO_DIR = proto
SERVER_DIR = server
CLIENT_DIR = client

.PHONY: build
build:
	protoc -I${PROTO_DIR} --go_opt=module=${PACKAGE} --go_out=./${PROTO_DIR} --go-grpc_opt=module=${PACKAGE} --go-grpc_out=./${PROTO_DIR} ./${PROTO_DIR}/*.proto
	go build -o ${BIN_DIR}/${SERVER_BIN} ./${SERVER_DIR}
	go build -o ${BIN_DIR}/${CLIENT_BIN} ./${CLIENT_DIR}