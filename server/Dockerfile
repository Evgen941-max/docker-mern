FROM node:16

WORKDIR /app

COPY package.json .

RUN npm install && npm update

COPY . .

EXPOSE 5000

CMD ["node", "app.js"]