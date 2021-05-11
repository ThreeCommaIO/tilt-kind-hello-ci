GOFILES = $(shell find . -name '*.go')

default: build

tmp:
	mkdir -p tmp

build: tmp/helloworld

tmp/helloworld: $(GOFILES)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o tmp/helloworld .