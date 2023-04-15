provider "aws" {
region = "us-east-1"
  access_key = "AKIARNP7QAI3X6BNXDIE"
  secret_key = "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"
}
resource "aws_instance" "one" {
count=3
ami = "ami-0aa2b7722dc1b561"
instance_type = "t2.micro"
}
resource "aws_s3_bucket" "two" {
bucket = "harry452"
}
