Shadowfax DevOps Case Study 
 Task 1: Flask App Containerization
1. Built using Python + Flask
2. Dockerized using a `Dockerfile`
3. Exposes app on port `5000`

Task 2: CI/CD Pipeline
- GitHub Actions:
  1. Runs unit tests (`pytest`)
  2. Builds Docker image
  3. Pushes image to DockerHub
  4. SSH deploys to AWS EC2

SSH Deployment Setup
1. SSH private key (base64) added to GitHub Secrets
2. DockerHub credentials also stored as GitHub Secrets
3. GitHub Actions uses `appleboy/ssh-action` to deploy to EC2
4. EC2 runs:
  ```bash
  docker pull nidhi1810/shadowfax-flask-app:latest
  docker run -d -p 5000:5000 --name flask-app nidhi1810/shadowfax-flask-app:latest
