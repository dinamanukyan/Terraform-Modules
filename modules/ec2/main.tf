provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.50.0.0/16"

  tags = {
    Name = "my-Terraform-vpc"
  }
}

resource "aws_subnet" "my-subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.50.1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-subnet"
  }
}
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  vpc_id           = aws_vpc.main.id
  description = "Allow HTTP access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id = aws_subnet.my-subnet.id

  tags = {
    Name = "Terraform-EC2"
  }
}
