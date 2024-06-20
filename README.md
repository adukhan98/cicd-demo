# CI/CD End-to-End Pipeline Demo

This is a demo CI/CD end-to-end pipeline.

## Tools and Technologies Used
- **Docker**
- **Maven**
- **Jenkins**
- **SonarQube**
- **ArgoCD**
- **Kubernetes (miniKube)**
- **Python**
   
### The architecture and workflow of my CI/CD pipeline is as follows :

![cicd_demo (1)](https://github.com/adukhan98/cicd-demo/assets/100485489/b330ff87-053f-4d4e-86b4-267c71a043fe)

### I divided this entire project into 4 phases:

![image](https://github.com/adukhan98/cicd-demo/assets/100485489/5175ee44-701b-491d-905e-1fddb513a9f6)

## Phase 1: Network Infrastructure

### Isolation and Privacy
- **Virtual Private Cloud (VPC)**: Created a new VPC to ensure network isolation and privacy.

### Security Groups
Configured security groups in AWS to open the necessary ports:
- **8080**: Jenkins
- **9000**: SonarQube
- **22**: SSH
- **443**: HTTPS
- **80**: HTTP

### EC2 Instance Configuration
- **Instance Type**: Used `t2.large`
- **Operating System**: Ubuntu

### Deployment
- Initially deployed all components manually.
- Automated the deployment using Terraform and verified the setup.

### Setup
Installed and configured the following on the EC2 instance:
- Kubernetes (K8s)
- Jenkins
- Docker
- SonarQube

The infrastructure is now ready for use.

## Phase 2: Source/Version Control

### Git Repository Setup
- **Repository Creation**: Created a Git repository named `cicd-demo` for source control and version control.
- **Initialization**: Initialized the repository and pushed the code base to the Git repository for subsequent steps.

### Automation Script
- **Python Script**: Developed a Python script to clone and pull the latest version of the repository after code changes are committed.

## Phase 3: CI/CD Pipeline

### Jenkins Configuration
Configured Jenkins to automate the following tasks:

1. **Build and Test Application**:
   - Use Maven to build and test the application, resulting in a `.jar` file.

2. **Static Code Analysis**:
   - Perform static code analysis using SonarQube.

3. **Docker Image Build and Push**:
   - Build the Docker image.
   - Push the Docker image to the Docker registry.

### Deployment
- **Kubernetes Deployment**:
  - Deploy the code to the Kubernetes (K8s) cluster using ArgoCD.
  - *Note*: Currently facing some issues with setting up ArgoCD.

### Additional Notes
- **GitHub Actions**:
  - GitHub Actions is also a viable option for CI/CD as it is an integrated feature within GitHub.

The Jenkins pipeline is set up to handle the build, test, code analysis, and Docker image management steps. Deployment to the Kubernetes cluster is underway, with further improvements in progress.

## Phase 4: Monitoring and Logging (In Progress)

### Monitoring and Visualization
- **Prometheus and Grafana**:
  - Configuring Prometheus for monitoring.
  - Setting up Grafana for visualizing logs and other parameters.

### Notifications
- **Email Notifications**:
  - Writing a script to send email notifications if the pipeline fails at any stage (in progress).

The monitoring and logging setup is currently in progress, with Prometheus and Grafana being configured for comprehensive monitoring and visualization. Additionally, an email notification system is being developed to alert in case of pipeline failures.



Here is the screenshot of the Jenkins Pipeline:

<img width="516" alt="image" src="https://github.com/adukhan98/cicd-demo/assets/100485489/fd018162-21ec-455c-a304-dc7d10d5d29c">


