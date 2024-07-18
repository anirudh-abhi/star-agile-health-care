provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "worker_node-1" {
  ami           = "ami-0e1ed41781c7602e8" # Update with your preferred AMI
  instance_type = "t2.micro"

  tags = {
    Name = "worker_node-1"
  }
}

resource "aws_instance" "worker_node-2" {
  count         = 2
  ami           = "ami-0e1ed41781c7602e8" # Update with your preferred AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Worker_node-2${count.index}"
  }
}

resource "aws_security_group" "aws_sg" {
  name = "aws_sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
