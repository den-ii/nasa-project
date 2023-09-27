FROM node:lts-alpine

WORKDIR /app

COPY package*.json .

COPY client/package*.json ./client/

RUN cd client && npm install

COPY client/ ./client/

COPY server/package*.json server/

RUN cd server && npm install

COPY server/ ./server/

RUN cd client && npm run prod-build

EXPOSE 3000

RUN cd server && npm start

USER node

CMD [ "npm", "run", "server"]
