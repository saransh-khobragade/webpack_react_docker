FROM node:alpine as build
ENV NGINX_PORT=$NGINX_PORT
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm i
RUN npm run build
RUN echo $NGINX_PORT

FROM nginx:stable-alpine
COPY --from=build /app/public /usr/share/nginx/html
# new
COPY nginx/nginx.conf /nginx.template
COPY entrypoint.sh ./
RUN chmod -R 777 /entrypoint.sh
EXPOSE $NGINX_PORT
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

# FROM node:alpine as build

# WORKDIR /app
# COPY package.json ./
# COPY package-lock.json ./
# COPY ./ ./
# RUN npm i
# RUN npm run build

# FROM nginx:stable-alpine
# COPY --from=build /app/public /usr/share/nginx/html
# # new
# COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 8080
# ENTRYPOINT ["nginx", "-g", "daemon off;"]