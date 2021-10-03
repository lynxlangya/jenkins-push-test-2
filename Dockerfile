FROM node:lts-alpine

COPY ./ /app

WORKDIR /app

RUN npm install -g yarn -registry=https://registry.npm.taobao.org && yarn build

FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
