# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
  alias  = "us_east_1"
  // access_key = var.access_key
  //secret_key = var.secret_key

}

# Filter out local zones, which are not currently supported 
# with managed node groups
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}



resource "random_string" "suffix" {
  length  = 8
  special = false
}
