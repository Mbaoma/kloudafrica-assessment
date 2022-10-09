## Overview of the application
The application is a TypeScript node starter. it is a 3 tier application built with Node.js (backend), mongodb (database) and pug, a template engine (frontend).
Typescript was used to implement the logic in this application.

We take the following steps to achieve the aim of this project, which is to use AWS CloudFormation to automate the process of dockerizing and implementing monitoring into this application.

### Steps:
- Build the app locally
- Dockerize the application and its requirements
- Set up CI/CD with Travis, to 
-- rebuild images
-- save to docker hub
-- redeploy images on K8s cluster
- Build a CloudFormation script that
    - publishes the docker container using EKS  

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
<img width="1317" alt="image" src="https://user-images.githubusercontent.com/49791498/192899812-7d2d2587-0ca4-47c5-aeb2-f00ed54a8fe7.png">

### Dockerizing the Application
- Create a Dockerfile at the root of the application folder.
- Run the Docker commands to build the image
```bash
docker login
docker build -t <name_for_image> .
docker-compose up -d
```

<img width="1317" alt="image" src="https://user-images.githubusercontent.com/49791498/192899322-60c0fed3-5b4c-4951-9d94-5c56d5b741a3.png">

- Setup [MONGODB_URI](https://www.mongodb.com/atlas/database) and replace this value in your .env.example file.

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

### Set up CI/CD with Travis
-- rebuild images
-- save to docker hub
-- redeploy images on K8s cluster

### Deploy the container to ECR 
- Create an ECR repository
```bash
aws cloudformation create-stack --stack-name kloud-assessment-repo --template-body file://ecr.yml --region us-west-1
```

- Create an ECR repo (ensure Docker is running0) 
```bash
$ aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com
```

- Push the image to ECR
```bash
$ docker build -t <ecr-repo> .
$ docker tag <image_tag> aws_account_id.dkr.ecr.region.amazonaws.com/my-repository:tag
$ docker push aws_account_id.dkr.ecr.region.amazonaws.com/my-repository:tag
```

- Build the stack to run the web application
```bash
$ aws cloudformation create-stack --stack-name runner  --template-body file://runner.yml --capabilities CAPABILITY_IAM --region us-west-2 
```

- Use ECS (Elastic Container Service) and Fargate to run the Docker container on EC2 instances.

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

## Debugging
[npm install error](https://sebhastian.com/npm-err-code-1/#:~:text=code%201%20error%20usually%20occurs,installed%20properly%20on%20your%20computer.&text=This%20means%20that%20npm%20fails,to%20the%20n%2Dapp%20project.)
[npm run build error](https://stackoverflow.com/questions/60092642/ts1086-an-accessor-cannot-be-declared-in-ambient-context)