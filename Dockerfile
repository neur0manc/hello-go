FROM golang:alpine as builder
COPY main.go .
ENV CGO_ENABLED 0
ENV GOOS linux
RUN apk add --no-cache git
RUN go get github.com/prometheus/client_golang/prometheus && \
	go get github.com/prometheus/client_golang/prometheus/promhttp
RUN go build -o /hello -a -tags netgo -ldflags '-w' .

FROM scratch
COPY --from=builder /hello .
EXPOSE 8080
CMD ["/hello"]

