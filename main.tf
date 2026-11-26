provider "aws" {
  region = "ap-northeast-1"
}

data "aws_ami" "amzn_ami_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*x86_64-gp2"]
  }
}

resource "aws_instance" "Web_server" {
  ami           = data.aws_ami.amzn_ami_linux
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer-${terraform.workspace}"
  }
}

output "instance_id" {
  value = aws_instance.Web_server.id
}

output "instance_public_ip" {
  value = aws_instance.Web_server.public_ip
}