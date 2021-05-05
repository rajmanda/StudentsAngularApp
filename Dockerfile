# base image
FROM node:12.2.0 AS builder

# set working directory
WORKDIR /stundetsAngularApp
COPY . .
RUN npm i
RUN npm run build --prod

FROM nginx:latest
COPY --from=builder /stundetsAngularApp/dist/my-dream-app /usr/share/nginx/html  

#Refer:
# https://www.youtube.com/watch?v=G9b-R9ljuCw
# Angular 10 Docker Tutorial | Dockerize Angular App and Deploy to Docker Hub [ STEP BY STEP GUIDE]
