provider "aws" {
  region = "ap-south-1" # Change as per your requirement and availability zone
}

resource "aws_instance" "firsttemplateforEC2" {
  ami           = "ami-07e29570afffc72c1"
  instance_type = "t2.micro"

  tags = {
    Name       = "EC2-instance-tf" # Change the name as per your requirement
    "Nov-2025" = "EC2-instance"
      }
}