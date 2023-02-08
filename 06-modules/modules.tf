//Module 1
module "sg" {
  source = "./sg"
}

//Module 2
module "ec2" {
  source            = "./ec2"
  //send the output of sg module to ec2 module
  security_group_id = module.sg.security_group_id
}

terraform {
  backend "s3" {
    bucket = "rajstatefilebucket"
    key    = "05-modules/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

