FROM node:16 AS builder
USER root
WORKDIR /source
COPY app/package.json ./
RUN npm install --production

FROM node:16
USER root
WORKDIR /app
COPY --from=builder --chown=node:node /source ./
COPY --chown=node:node app/server ./server

USER node
EXPOSE 3000
