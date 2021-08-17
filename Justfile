# Environment Variables
export CGO_ENABLED := "0"

# Build binary
build:
    @go build -o ./hello -a -tags netgo -ldflags '-w'
