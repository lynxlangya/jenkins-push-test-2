FROM node:lts-alpine

RUN mkdir -p /app 
WORKDIR /app
COPY package*.json /app
# 设置Node-Sass的镜像地址
RUN npm config set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass
# 设置npm镜像
RUN npm config set registry https://registry.npm.taobao.org
RUN cd /app && npm install
COPY . /app
RUN npm run build

FROM nginx
# RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
