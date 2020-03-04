variable "access_key" {
  description = "API access key"
  type        = "string"
}

variable "secret_key" {
  description = "API secret key"
  type        = "string"
}

variable "vpc_cidr" {
  description = "CIDR main VPC"
  type        = "string"
  default     = "10.0.0.0/16"
}
variable "vpc_id" {}
