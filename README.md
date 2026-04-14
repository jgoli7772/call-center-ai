# Docker

---

## Build

`docker build . -t callcenter-ai`

## Run

`docker run -p 3002:80 --name callcenter-ai -d callcenter-ai`

## Stop & Remove

```sh
docker stop callcenter-ai && docker rm callcenter-ai
```