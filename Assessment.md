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
npm install
```

- Start your mongoDB server (you'll probably want another command prompt)
```
sudo chmod 777 /usr/local/var/mongodb
mongo
```

- Build and run the project
```
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
docker-compose up
```
- Push the image to Dockerhub
```bash
docker tag <image_id> <username>/<image_name:tag>
docker push <username>/<image_name>
```

![Docker Image](https://user-images.githubusercontent.com/49791498/157544579-25a4ad0b-8d05-4253-bfb2-d195175c5430.png)

- Pull the image from DockerHub
```bash
docker run --net iac-test_default -p 3000:3000 docker.io/mbaoma/kloudafrica
```
### Setting Up Cloudformation
- Install the AWS CLI
```bash
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```
- Set up AWS credentials on the CLI
```bash
aws configure
```

- To set up the container using Cloudformation, run the following command:
```bash
chmod u+x create-stack 
./create-stack 
```

- To delete the resources, run the following:
```bash
chmod u+x delete-stack 
./delete-service-stack
```
