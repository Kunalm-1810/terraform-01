terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  
  }
  #creating vpc 
  resource "aws_vpc" "home_vpc" {
  cidr_block = "10.0.0.0/16"
  }

  #configure the aws provider
    provider "aws" {
    region = "ap-south-1"
}
#create a sc3 bucket
resource "aws_s3_bucket" "home_bucket" {
  bucket = "home-terraform-bucket"

  tags = {
    Name = "home_bucket"
    Environment = "dev"
  }
}
resource "aws_s3_object" "object_upload" {
    bucket = aws_s3_bucket.home_bucket.id
    key    = "diagram.docx"
    source = "c:/Users/swapn/nov-2025/home-dir/terraform-home/yt-piyush/diagrams/diagram.docx"
  }
  
