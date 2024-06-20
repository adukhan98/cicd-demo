# cicd-demo
This is a demo cicd end-to-end pipeline.


Tools and Technologies used here : Docker, Maven, Jenkins, SonarQube, ArgoCD, Kubernetes(miniKube), Python 

The architecture and workflow of my CI/CD pipeline is as follows :

![cicd_demo (1)](https://github.com/adukhan98/cicd-demo/assets/100485489/b330ff87-053f-4d4e-86b4-267c71a043fe)

I divided this entire project into 4 phases:

![image](https://github.com/adukhan98/cicd-demo/assets/100485489/5175ee44-701b-491d-905e-1fddb513a9f6)

## Phase 1: Infra
Network Infra has to be isolated and private.
Created a new VPC to use.
Made security groups in AWS opening up the following ports:8080: Jenkins, 9000: SonarQube ,22: SSH ,443: HTTP , 80:HTTPS.

When launching the EC2 instance used t2.large with Ubuntu as OS.
Deployed all manually and then by using Terraform and verified it as well. 
Setup k8s, Jenkins, Docker Sonar, etc. on the EC2 instance, and the infra was ready to use and work with.


![image](https://github.com/adukhan98/cicd-demo/assets/100485489/21698506-0ba0-4fb4-9c79-cf1dc058fd52)




Here is the screenshot of the Jenkins Pipeline:

<img width="516" alt="image" src="https://github.com/adukhan98/cicd-demo/assets/100485489/fd018162-21ec-455c-a304-dc7d10d5d29c">


