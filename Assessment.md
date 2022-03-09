## Overview of the application
The application is a TypeScript node starter. it is a 3 tier application built with Node.js (backend), mongodb (database) and pug, a template engine (frontend).
Typescript was used to implement the logic in this application.

We take the following steps to achieve the aim of this project, which is to use AWS CloudFormation to automate the process of dockerizing and implementing monitoring into this application.

### Steps:
- Build the app locally
- Dockerize the application and its requirements
- Build a CloudFormation script that
    - Uses ECS service to setup the Docker container 
    - Codify the process of setting up this infrastructure 

### Install required dependencies for the app to run locally
- Install [Node.js 14](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/)
- Install [MongoDB](https://docs.mongodb.com/manual/installation/)
- Install [VS Code](https://code.visualstudio.com/)
- Install [Redis](https://developer.redis.com/create/homebrew/)

### Getting started
- Clone the repository
```
git clone --depth=1 https://github.com/Microsoft/TypeScript-Node-Starter.git <project_name>
```
- Install dependencies
```
cd <project_name>
brew install eslint
eslint --init
npm install -g typescript
npm install
```

- Start your mongoDB server (you'll probably want another command prompt)
```
sudo chmod 777 /usr/local/var/mongodb
mongo
```

- Build and run the project
```
export REDIS_HOST=my-redis
npm install node-sass@4.14.0
npm run build
npm start
```
<img width="1230" alt="image" src="https://user-images.githubusercontent.com/49791498/156895830-90ac7a30-6624-414d-8c3f-1420a6cc8c1e.png">


### Dockerizing the Application
- Create a Dockerfile at the root of the application folder.
- Run the Docker commands to build the image
```bash
docker login
docker build -t <name_for_image> .
sudo docker run -d -p <Browser_expose_port>:<application port> <image_id/name>
```

### Docker Compose
- Run docker-compose to build the entire application
```bash
docker-compose up
```