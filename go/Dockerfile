FROM golang:1.8.0

WORKDIR /go/src/app
COPY main.go ./

RUN go build -o webserver .

CMD ["./webserver"]
