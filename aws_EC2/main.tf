resource "aws_instance" "ec2-mod" {
  ami = var.ami
  instance_type = var.type
  availability_zone = var.az
}

resource "aws_security_group" "secgrp" {
  name = var.fwname

  ingress {
    from_port = var.inport
    protocol = var.inprot
    to_port = var.inport
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = var.egport
    protocol = var.egprot
    to_port = var.egport
    cidr_blocks = ["0.0.0.0/0"]
  }
}