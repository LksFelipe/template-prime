FROM node:14 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm build

FROM nginx:1.21
COPY --from=node /app/dist/template-prime /usr/share/nginx/html
EXPOSE 80
