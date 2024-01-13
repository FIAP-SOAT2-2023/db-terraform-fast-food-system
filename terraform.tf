# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"

    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.14.0"
    }

  }


  backend "s3" {
    bucket = "terraform-state-db-fast-food-system"
    key    = "terraform/state"
    region = "us-east-1"
  }
  /**/

  required_version = "~> 1.3"
}

