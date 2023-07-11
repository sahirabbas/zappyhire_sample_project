# Stage 1: Build the Angular app
FROM node:14 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build -- --prod

# Stage 2: Serve the app using Nginx
FROM nginx:1.21-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist/zappy_boiler_plate /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

