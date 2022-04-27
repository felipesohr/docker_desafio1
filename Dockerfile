FROM golang:1.18 AS builder

WORKDIR /usr/src/app

RUN go mod init example/hello

COPY . .

RUN mkdir output 
RUN go build .

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder ./usr/src/app/hello .

CMD [ "./hello" ]