# base image
FROM node:12.2.0

# install chrome for protractor tests
#RUN apt-get update && \
#    apt-get install -y software-properties-common && \
#    rm -rf /var/lib/apt/lists/*
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#RUN apt-get update && apt-get install -yq google-chrome-stable

# Use `node` user that `node:lts-alpine` provides
#RUN mkdir -p /app
RUN chown node /app
#USER node
#WORKDIR /app


# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli

# add app
COPY . /app

# start app
CMD ng serve --host 0.0.0.0 --port 4200

EXPOSE 4200

###### To Build the Docker Image run the following command
# docker build -t studentsapp ./

###### To Run the docker Image run the following command 
# docker run -d -p 4200:4200 docker.io/library/studentsapp

#Refer:
# https://mherman.org/blog/dockerizing-an-angular-app/ 
