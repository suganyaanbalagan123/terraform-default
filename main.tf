provider "aws" {
  region = "ap-south-1"  # Update with your desired region
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"  # Update with your desired CIDR block
}

resource "aws_subnet" "default" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.0.0/24"  # Update with your desired subnet CIDR block
  availability_zone       = "ap-south-1a"   # Update with your desired availability zone
}

resource "aws_instance" "example" {
  ami           = "ami-0f5ee92e2d63afc18"  # Update with your desired AMI ID
  instance_type = "t2.micro"                # Update with your desired instance type
  subnet_id     = aws_subnet.default.id

  tags = {
    Name = "example-instance"
  }
}
