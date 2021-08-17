FROM golang:latest as builder
ENV CGO_ENABLED 0
ENV GOOS linux
RUN mkdir -p $GOPATH/src/github.com/ls42/hello-go
WORKDIR $GOPATH/src/github.com/ls42/hello-go
COPY main.go .
RUN go build -o /hello -a -tags netgo -ldflags '-w' .

FROM scratch
COPY --from=builder /hello .
EXPOSE 8080
CMD ["/hello"]

