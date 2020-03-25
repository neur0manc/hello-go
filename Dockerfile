FROM golang:alpine as builder
COPY main.go .
ENV CGO_ENABLED 0
ENV GOOS linux
RUN go build -o /hello -a -tags netgo -ldflags '-w' .

FROM scratch
COPY --from=builder /hello .
EXPOSE 8080
CMD ["/hello"]

