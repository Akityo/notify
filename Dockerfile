FROM golang:1.16.0-alpine as build-env
RUN GO111MODULE=on go get -v github.com/akityo/notify/cmd/notify

FROM alpine:latest
COPY --from=build-env /go/bin/notify /usr/local/bin/notify

ENTRYPOINT ["notify"]
