# build app
FROM docker.io/node AS builder

RUN apt update
RUN apt install git

COPY . /app
WORKDIR /app

RUN npm install

# build final
FROM gcr.io/distroless/nodejs:16

COPY --from=builder /app /

CMD ["src/index.js"]