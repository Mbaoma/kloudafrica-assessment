#Each instruction in this file creates a new layer
#Here we are getting our node as Base image
FROM node:14.16.0-alpine3.10


#setting working directory in the container
WORKDIR /usr/app

#copying the package.json file(contains dependencies) from project source dir to container dir
COPY package*.json ./

# installing the dependencies into the container
RUN npm install

#copying the source code of Application into the container dir
COPY . ./
RUN npm i -P node-redis
RUN npm install node-sass@4.14.0
RUN npm run build

# #container exposed network port number
EXPOSE 3000

#command to run within the container
CMD ["npm", "start"]

