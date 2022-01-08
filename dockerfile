FROM node:10.19-alpine

COPY . .
WORKDIR /web_app
RUN npm install 
EXPOSE 3000

CMD ["node","app.js"]