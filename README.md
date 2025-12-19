# CI/CD DevOps Project (Shell + Docker)

## Project Overview
This project implements a basic CI/CD workflow using Shell scripting and Docker.  
The workflow automates three main stages: build, test, and deploy.  
All stages are executed through shell scripts and are designed to be directly integrated into a CI/CD pipeline.

## Project Structure
.
├── app/
│   └── index.html  
├── docker/
│   └── Dockerfile  
├── scripts/
│   ├── build.sh  
│   ├── test.sh  
│   └── deploy.sh  
└── README.md  

## Build Stage
The build stage creates a Docker image for the application using the provided Dockerfile.  
This stage fails immediately if the build process encounters an error.

Command executed:
docker build -t myapp .

## Test Stage
The test stage validates the application content before deployment.  
If the validation fails, the process stops and returns a non-zero exit code.

Command executed:
grep -q "CI/CD" app/index.html

## Deploy Stage
The deploy stage removes any existing container and starts a new container from the built image.  
The application is exposed on port 8080.

Commands executed:
docker rm -f myapp || true  
docker run -d -p 8080:80 --name myapp myapp

## Docker Configuration
The Docker image is based on Nginx Alpine and serves the application as static content.

Dockerfile content:
FROM nginx:alpine  
COPY app /usr/share/nginx/html  

## Execution Flow
The project is executed sequentially as follows:
1. Build the Docker image
2. Test the application
3. Deploy the container

Commands:
bash scripts/build.sh  
bash scripts/test.sh  
bash scripts/deploy.sh  

## Result
After successful execution:
- The Docker image is built
- The application passes the test stage
- The application is deployed and accessible at http://localhost:8080
