provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "nidhi_key" {
  key_name   = "nidhi-key"
  public_key = file("C:/Users/gagan/.ssh/id_rsa.pub") # Make sure this path is correct
}

resource "aws_security_group" "flask_sg" {
  name        = "flask-sg"
  description = "Allow SSH and Flask traffic"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Flask"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "flask_ec2" {
  ami           = "ami-07d9b9ddc6cd8dd30" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name      = aws_key_pair.nidhi_key.key_name
  security_groups = [aws_security_group.flask_sg.name]

  tags = {
    Name = "shadowfax-ec2-terraform"
  }
}
