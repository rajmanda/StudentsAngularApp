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


# docker build -t studentsangularapp ./   {builds the docker image}
# docker run -d -p 4200:80 docker.io/library/studentsangularapp
# open browser t localhost:4200/home

# To Push the image to Docker Hub
# Create the  students-angular-app in docker hub.
# docker tag studentsangularapp:latest  dockerrajmanda/students-angular-app:latest
# docker push dockerrajmanda/students-angular-app:latest