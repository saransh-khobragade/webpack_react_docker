FROM node:alpine as build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm i
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/public /usr/share/nginx/html
# new
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]