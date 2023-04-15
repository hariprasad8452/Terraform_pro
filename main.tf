provider "aws" {
region = "us-east-1"
  access_key = "AKIARNP7QAI3X6BNXDIE"
  secret_key = "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"
}
resource "aws_instance" "one" {
count=3
ami = "ami-06e46074ae430fba6"
instance_type = "t2.micro"
}
resource "aws_s3_bucket" "two" {
bucket = "harry452"
}
resource "aws_instance" "three" {
ami = "ami-069aabeee6f53e7bf"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.harrysg.id]
availability_zone = "us-east-1a"
user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "🙋‍♂️🙋‍♂️🙋‍♂️Hello...! Connections💁‍♂️ this is Terraform infrastructure🏦🏨 developed👨‍💻👨‍ by HARRY😗🙃 using Jenkins Pipeline🔗😍😍" > /var/www/html/index.html
EOF
tags = {
 Name = "HARRY"
}
}
resource "aws_security_group" "harrysg" {
  name = "some"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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
