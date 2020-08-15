FROM node:12.18.3-buster-slim

RUN apt-get update -qq && apt-get install -y vim && apt-get update

RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]