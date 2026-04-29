# build stage
FROM node:lts-alpine AS build-stage

WORKDIR /app

COPY ./vue-front-end/package*.json .

RUN npm install

COPY ./vue-front-end .
# Ignore `node_modules` since we already installed the latest versions before
COPY --exclude=*/node_modules . .
RUN npm run build

# production stage

FROM nginx:stable-alpine AS production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]