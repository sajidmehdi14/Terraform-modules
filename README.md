# Adding/ Updating Terraform-modules

$ git clone https://github.com/sajidmehdi14/Terraform-modules

$ cd Terraform-modules/

$ rm -rf aws_* && cp /updated-code/* .

$ git add *

$ git commit -m "Terraform-modules v4.1" -a

$ git tag -a "v4.1" -m "ver 4.1"

# Using Terraform-modules tag 4.x

$ cat main.tf
module "aws-compute" {
// Modules starting 4.x are for production
  source = "git::https://github.com/sajidmehdi14/Terraform-modules.git//aws_EC2?ref=v4.1"

  type = "t2.micro"
  ami = data.aws_ami.ami.id
  az = "us-east-1a"
  fwname = "sg_prod" # sg-prod gives error with -
  inport = 80
  inprot = "tcp"
//  ingressmap = var.ingressprod  # For ver 4.2
  secgrp = module.aws-compute.secgrp
  tags = "ec2-prod"

}
#############################################
$ cat variable.tf
data "aws_ami" "ami" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.20200722.0-x86*"]
  }
}

// For v4.2
variable "ingressprod" {
  default = [{inport=80,inprot="tcp"},{inport=22,inprot="tcp"}]
}
#############################################
$ cat provider.tf
provider "aws" {
 region = "us-east-1"
// region = var.region  // verginia
}

provider "aws" {
 region = "us-east-2"
 alias = "ohaio"
 // region = var.region
}

provider "google" {
//  region = "us-east4"
//  zone = "us-east4"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = file("./xyz-abc.json")
  project = "xyz-abc-abc"
}

provider "azurerm" {
 features {}
}
#######################################



