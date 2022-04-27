FROM golang:1.18 AS builder

RUN apt-get update && apt-get install bash

WORKDIR /usr/src/app

RUN go mod init example/hello

COPY . .

RUN mkdir output 
RUN go build .

FROM alpine:latest
WORKDIR /usr/src/app
COPY --from=builder ./usr/src/app/hello .

CMD [ "./hello" ]