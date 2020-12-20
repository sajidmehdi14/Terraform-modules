variable "type" {
  type = string
}
variable "az" {
  type = string
}
variable "ami" {
  type = string
}

variable "tags" {
  type = string
}

variable "fwname" {
  type = string
  default = "secgroup"
}
variable "inport" {
  default = 0
}
variable "inprot" {
  default = "-1"
}

variable "secgrp" {
}

variable "egport" {
  default = 0
}
variable "egprot" {
  default = "-1"
}

variable "ingressmap" {
  default = [{inport=80,inprot="tcp"},{inport=22,inprot="tcp"}]
}
