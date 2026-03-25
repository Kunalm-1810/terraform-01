terraform {
    backend "s3" {
    bucket = "home-terraform-tfstate1"# in this bucket terraform state file will be stored
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
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
resource "aws_s3_bucket" "home_bucket1" {  #the terraform state file of this bucket will be stored in the above mentioned bucket
  bucket = "home-terraaform-state"

  tags = {
    Name = "home_bucket1"
    Environment = "dev"
  }
}
#resource "aws_s3_object" "object_upload" {
 #   bucket = aws_s3_bucket.home_bucket.id
  #  key    = "diagram.docx"
   # source = "c:/Users/swapn/nov-2025/home-dir/terraform-home/yt-piyush/diagrams/diagram.docx"
  
  resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
  }
  
