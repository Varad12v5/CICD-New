# 🚀 Spring Boot CI/CD Pipeline on AWS

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/your-repo)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This repository demonstrates a complete CI/CD pipeline for deploying a Spring Boot application to AWS ECS using Docker, Amazon ECR, AWS CodeBuild, and AWS CodePipeline. The pipeline is fully automated — any push to GitHub triggers a new deployment.

---

## 📦 Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo/cicd-new.git
   cd cicd-new
   ```
2. **Build the project locally:**
   ```bash
   mvn clean package
   ```
3. **Run with Docker:**
   ```bash
   docker build -t spring-cicd-demo .
   docker run -p 8080:8080 spring-cicd-demo
   ```

## 🛠️ Prerequisites
- Java 17+
- Maven 3.6+
- Docker
- AWS CLI (configured)
- AWS Account with permissions for ECS, ECR, CodeBuild, CodePipeline

## 🧑‍💻 Local Development
- To run without Docker:
  ```bash
  mvn spring-boot:run
  ```
- Access the app at [http://localhost:8080](http://localhost:8080)

---

## 🧩 Architecture Overview

**High-level Flow:**
1. Developer pushes code to GitHub
2. AWS CodePipeline detects the change
3. AWS CodeBuild builds the application & Docker image
4. Docker image is pushed to Amazon ECR
5. AWS ECS pulls the image and runs the container

![Architecture Diagram](docs/ci-cd.png)

## 🛠️ Tech Stack
- Spring Boot – Backend application
- Docker – Containerization
- GitHub – Source code repository
- AWS CodeBuild – CI (Build & Docker image creation)
- Amazon ECR – Docker image registry
- AWS ECS (Fargate) – Container orchestration
- AWS CodePipeline – CD (deployment automation)

---

## 🔄 Detailed CI/CD Flow (Step-by-Step)

### 1. Spring Boot Application
- Standard Spring Boot project
- Dockerfile included to containerize the app

### 2. Docker Image Creation
- Dockerfile:
  ```Dockerfile
  FROM eclipse-temurin:17-jdk-alpine
  WORKDIR /app
  COPY target/course-service.jar app.jar
  EXPOSE 8080
  ENTRYPOINT ["java","-jar","app.jar"]
  ```
- Image is tagged with build ID

### 3. buildspec.yml (CI Instructions)
- Defines build steps for AWS CodeBuild
- Runs Maven build, builds Docker image, pushes to ECR, generates `imagedefinitions.json`

### 4. AWS CodeBuild (CI)
- Triggered by CodePipeline
- Runs `mvn clean package`, builds/pushes Docker image, outputs artifacts

### 5. Amazon ECR
- Stores Docker images securely
- ECS pulls images directly from ECR

### 6. AWS CodePipeline (CD)
- Orchestrates the pipeline: Source (GitHub) → Build (CodeBuild) → Deploy (ECS)
- Any commit triggers the pipeline

### 7. AWS ECS (Fargate) Deployment
- ECS pulls latest image from ECR, runs containers (Fargate)
- Handles scaling, restarts, health checks

---

## 📁 Repository Structure
```
.
├── src/                     # Spring Boot source code
├── Dockerfile               # Docker image definition
├── buildspec.yml            # CodeBuild instructions
├── pom.xml                  # Maven configuration
├── docs/
│   └── cicd-architecture.png
└── README.md
```

---

## ✅ Key Benefits
- Fully automated CI/CD
- No manual deployments
- Scalable & production-ready
- Dockerized microservice architecture
- Cloud-native AWS services

---

## 🚦 Deployment Trigger
- Any push to the main branch triggers the pipeline automatically
- No manual steps required after initial setup

---

## 🔐 IAM & Security Notes
- Ensure the following IAM roles exist:
  - CodeBuild service role (ECR access)
  - ECS task execution role
  - ECS service-linked role

---

## 🧠 Future Improvements
- Add ALB with health checks
- Enable Spring Boot Actuator
- Blue/Green deployments
- Multi-stage Docker builds
- Infrastructure as Code (CloudFormation / Terraform)

---

## 🤝 Contributing
Contributions are welcome! Please open issues or submit PRs for improvements.

---

## 📫 Contact
For questions or support, open an issue or contact [vbrahmapurkar@gmail.com].

---

## 📌 Conclusion
This project demonstrates a real-world, production-grade CI/CD pipeline for deploying Spring Boot applications on AWS using modern DevOps practices.