provider "aws" {
  region = "${var.region}"
}

provider "template" {
  version = "2.1.2"
}

terraform {
  backend "s3" {

  }
}