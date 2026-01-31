🚀 Spring Boot CI/CD Pipeline using AWS (GitHub → CodeBuild → ECR → ECS)

This repository demonstrates a complete CI/CD pipeline for deploying a Spring Boot application to AWS ECS using Docker, Amazon ECR, AWS CodeBuild, and AWS CodePipeline.

The pipeline is fully automated — any push to GitHub triggers a new deployment.

🧩 Architecture Overview

High-level Flow

Developer pushes code to GitHub

AWS CodePipeline detects the change

AWS CodeBuild builds the application & Docker image

Docker image is pushed to Amazon ECR

AWS ECS pulls the image and runs the container

🛠️ Tech Stack

Spring Boot – Backend application

Docker – Containerization

GitHub – Source code repository

AWS CodeBuild – CI (Build & Docker image creation)

Amazon ECR – Docker image registry

AWS ECS (Fargate) – Container orchestration

AWS CodePipeline – CD (deployment automation)

🔄 Detailed CI/CD Flow (Step-by-Step)
Step 1: Spring Boot Application

The application is a standard Spring Boot project.

A Dockerfile is included to containerize the application.

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY target/course-service.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

Step 2: Docker Image Creation

Docker uses the Dockerfile to build an image containing:

Java runtime

Spring Boot JAR

The image is tagged using the build ID.

Step 3: buildspec.yml (CI Instructions)

buildspec.yml defines the build steps for AWS CodeBuild.

Key responsibilities:

Run Maven build

Build Docker image

Push image to Amazon ECR

Generate imagedefinitions.json for ECS deployment

Step 4: AWS CodeBuild (CI)

Triggered automatically by CodePipeline.

CodeBuild performs:

mvn clean package

Docker image build

Docker image push to Amazon ECR

Output:

Docker image in ECR

imagedefinitions.json artifact

Step 5: Amazon Elastic Container Registry (ECR)

Stores Docker images securely.

Each build pushes a new versioned image.

ECS pulls images directly from ECR.

Step 6: AWS CodePipeline (CD)

Orchestrates the entire pipeline.

Stages:

Source – GitHub

Build – CodeBuild

Deploy – ECS

Any commit to GitHub automatically triggers the pipeline.

Step 7: AWS ECS (Fargate) Deployment

ECS service pulls the latest image from ECR.

Runs containers using Fargate (no EC2 management).

Handles:

Scaling

Restarts

Health checks

📁 Repository Structure
.
├── src/                     # Spring Boot source code
├── Dockerfile               # Docker image definition
├── buildspec.yml             # CodeBuild instructions
├── pom.xml                   # Maven configuration
├── docs/
│   └── cicd-architecture.png
└── README.md

✅ Key Benefits of This Setup

Fully automated CI/CD

No manual deployments

Scalable & production-ready

Dockerized microservice architecture

Cloud-native AWS services

🚦 Deployment Trigger

Any push to the main branch triggers the pipeline automatically

No manual steps required after initial setup.

🔐 IAM & Security Notes

Ensure the following IAM roles exist:

CodeBuild service role (ECR access)

ECS task execution role

ECS service-linked role

🧠 Future Improvements

Add ALB with health checks

Enable Spring Boot Actuator

Blue/Green deployments

Multi-stage Docker builds

Infrastructure as Code (CloudFormation / Terraform)

📌 Conclusion

This project demonstrates a real-world, production-grade CI/CD pipeline for deploying Spring Boot applications on AWS using modern DevOps practices.