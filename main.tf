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
