FROM node:12.16.2-alpine3.11

WORKDIR /usr/src/app

COPY package*.json ./
RUN yarn install
COPY . .

EXPOSE 8080
CMD ["npm", "start"]