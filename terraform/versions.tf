terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.77.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      owner = "abate"
    }
  }
}

variable "region" {
  description = "aws-region"
  default     = "us-oregon-2"
}