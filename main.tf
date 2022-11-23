# Specify the provider and access details
provider "aws" {
  region = "ap-south-1"
  version = 4.0
}

resource "aws_instance" "web1" {
  instance_type = "t2.micro"
  ami           = "ami-08c40ec9ead489470"

  # This will create 2 instances
  count = 2
}

resource "aws_instance" "web2" {
  instance_type = "t2.micro"
  ami           = "ami-06640050dc3f556bb"
}