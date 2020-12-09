variable "compute" {}

variable "vmname" {}

variable "gcpimage" {}

variable "gcpnet" {
  default = "network"
}

variable "gcpsub"{
  default = ""
}