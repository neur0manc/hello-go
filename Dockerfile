FROM golang:alpine as builder
ENV CGO_ENABLED 0
ENV GOOS linux
RUN mkdir -p $GOPATH/src/github.com/ls42/hello-go
WORKDIR $GOPATH/src/github.com/ls42/hello-go
COPY main.go .
RUN apk add --no-cache git upx
RUN go mod init github.com/ls42/hello-go
RUN go build -o /hello -a -tags netgo -ldflags '-w' .
RUN upx /hello

FROM scratch
COPY --from=builder /hello .
EXPOSE 8080
CMD ["/hello"]

