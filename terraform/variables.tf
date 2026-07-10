variable "project" {
  description = "Project name, used as a resource prefix"
  type        = string
  default     = "daley-helpers"
}

variable "environment" {
  description = "Deployment environment (dev/staging/prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
