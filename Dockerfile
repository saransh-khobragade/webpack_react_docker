FROM node:alpine as build
ENV PORT=8080
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm i
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/public /usr/share/nginx/html
# new
COPY nginx/templates /etc/nginx/templates
EXPOSE $PORT
ENTRYPOINT ["nginx", "-g", "daemon off;"]