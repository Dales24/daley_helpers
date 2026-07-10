# Mock Terraform starter — an S3 bucket. Replace names/region before applying.

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "helpers" {
  bucket = "${var.project}-${var.environment}-assets"

  tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "helpers" {
  bucket = aws_s3_bucket.helpers.id
  versioning_configuration {
    status = "Enabled"
  }
}
