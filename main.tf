# Configure the AWS provider
provider "aws" {
  region = "us-west-2"  # Specify the region
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cicd-demo-vpc"
  }
}

# Create a security group
resource "aws_security_group" "cicd_sg" {
  vpc_id = aws_vpc.main.id
  name   = "cicd-sg"

  # Allow incoming traffic on specific ports
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cicd-sg"
  }
}

# Find the latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create an EC2 instance
resource "aws_instance" "cicd_demo" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.large"
  vpc_security_group_ids = [aws_security_group.cicd_sg.id]
  subnet_id       = aws_subnet.main.id # Make sure to define a subnet within the VPC
  key_name        = ""    # Replace with your key pair name

  tags = {
    Name = "cicd-demo"
  }

  root_block_device {
    volume_size = 20
  }
}

# Create a Subnet
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "cicd-demo-subnet"
  }
}
