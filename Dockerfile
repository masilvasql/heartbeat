
FROM golang:1.23 AS builder


WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/server ./cmd/server/main.go


FROM alpine:3.18

WORKDIR /app

COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
