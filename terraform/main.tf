provider "aws" {
region = "us-east-1"
}
resource "aws_intsance" "one" {
count=3
ami = "ami-0aa2b7722dc1b561"
instance_type = "t2.micro"
}
resource "aws_s3_bucket" "two" {
name = "harry452"
}
