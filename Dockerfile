FROM node AS builder

COPY . /node

RUN cd /node && \
	npm install

FROM node:slim

COPY --from=builder /node /node

ENTRYPOINT [ "node", "/node/index.js" ]
