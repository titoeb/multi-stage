# Multi-stage build
# Builder image
FROM golang:1.8.0-alpine AS builder

WORKDIR /go/src/app
COPY main.go ./

RUN go build -o webserver .

# Container for binary.
FROM alpine

WORKDIR /app
COPY --from=builder /go/src/app /app
CMD ["./webserver"]
