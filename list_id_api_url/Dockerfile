FROM golang:alpine AS build-env
RUN apk --no-cache add git
RUN go get github.com/gin-gonic/gin
ADD . /go/src/github.com/btccom/btcpool_user_list
RUN cd /go/src/github.com/btccom/btcpool_user_list && \
    go build -v -o /src/bin/web web.go

FROM alpine
RUN apk --no-cache add openssl ca-certificates
WORKDIR /app
COPY --from=build-env /src/bin /app/
EXPOSE 8080
ENTRYPOINT ./web