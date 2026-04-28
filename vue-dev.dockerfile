FROM node:25-alpine

VOLUME [ "/app" ]

WORKDIR /app

COPY ./vue-front-end/package.json ./vue-front-end/package-lock.json ./
RUN npm ci

# COPY . .

EXPOSE 5173

# Start Vite dev server, binding to all interfaces so Docker can expose it
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]