variable "ami" {}

variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_security_group_id" {}
variable "identity" {}
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  secret_key = "${var.secret_key}"
  access_key = "${var.access_key}"
  region     = "${var.region}"
}

module "server" {
  source                = "./server"
  ami                   = "${var.ami}"
  instance_type         = "${var.instance_type}"
  subnet_id             = "${var.subnet_id}"
  vpc_security_group_id = "${var.vpc_security_group_id}"
  identity              = "${var.identity}"
}

output "public_ip" {
  value = "${module.server.public_ip}"
}

output "public_dns" {
  value = "${module.server.public_dns}"
}
