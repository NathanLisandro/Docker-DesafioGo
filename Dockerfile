FROM golang:alpine as builder

WORKDIR /app
COPY . .

RUN go build -o main .
#usei isso para diminuir o tamanho do binario, removendo simbolos e informações de debug.
RUN go build -ldflags="-s -w" -o main .

FROM scratch

COPY --from=builder /app/main /main

CMD ["/main"]
