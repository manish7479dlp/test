FROM node:latest

WORKDIR /app

COPY . .

RUN rm -r node_modules && npm install

CMD [ "npm", "start" ]