FROM node:latest

WORKDIR /app

COPY . .

RUN rm -rf node_modules && npm install

CMD [ "npm", "start" ]