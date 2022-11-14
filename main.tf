############ Setting The Providor And Source Version ############
terraform {
  required_providers{
    aws = {
        source = "hashicorp/aws"        # The AWS module repositroy.
        version = "~> 4.0"              # The range of AWS module verions.
    }
  }
}

############ Configuring The AWS Provider ############
provider "aws" {
    region = "us-east-1"                     # Confiruging the default region.
}

############ Creating A VPC ############
resource "aws_vpc" "daniel-popov-dev-vpc" {
    #               ^ This is only a reference name!

    cidr_block = "192.168.1.0/26"

    tags = {
      "Name" = "daniel-popov-dev-vpc"
      #         ^ This is the name it'll be called on Amazon.
    }
}

############ Connecting The VPC To The Internet ############
resource "aws_internet_gateway" "daniel-popov-internet-gateway" {
    
    vpc_id = aws_vpc.daniel-popov-dev-vpc.id

    tags = {
        "Name" = "daniel-popov-internet-gateway"
        #         ^ This is the name it'll be called on Amazon.
    }
}

############ Creating A Subnet In The VPC ############
resource "aws_subnet" "daniel-popov-k8s-subnet" {
    #                  ^ This is only a reference name!

    vpc_id = aws_vpc.daniel-popov-dev-vpc.id

    cidr_block = "192.168.1.0/27"

    tags = {
        "Name" = "daniel-popov-k8s-subnet"
        #         ^ This is the name it'll be called on Amazon.
    }

}

# Commands to run:
# AWS CLI CONFIGURE
# TERRAFORM INIT
# TERRAFROM PLAN
# TERRAFORM APPLY