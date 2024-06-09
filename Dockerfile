FROM node:latest as frontend

WORKDIR /app

COPY ./assets/ ./

RUN yarn install && yarn run build && apt update && apt install zip && zip -r assets.zip build/


FROM golang:1.22.1 as backend

WORKDIR /app
COPY . .
COPY --from=frontend /app/assets.zip .
RUN go env -w GOPROXY=https://goproxy.cn,direct && \
    go build -a -o cloudreve


FROM alpine:latest

WORKDIR /app

COPY --from=frontend /app/build/ /app/statics/
COPY --from=backend /app/cloudreve /app/
EXPOSE 5212
ENTRYPOINT [ "./cloudreve" ]