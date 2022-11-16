FROM golang:alpine3.16 AS build
WORKDIR /go/src/app
COPY . .
RUN go mod init && go build -o ./main

FROM scratch
COPY --from=build /go/src/app ./
ENTRYPOINT [ "./main" ]