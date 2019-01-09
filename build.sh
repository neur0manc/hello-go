#!/bin/sh
CGO_ENABLED=0 GOOS=linux go build -o ./output/hello -a -tags netgo -ldflags '-w' .
docker build -t brauer/hello-container .
