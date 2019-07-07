# specify a base image and tagging the phase as builder
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# port mapping
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html

