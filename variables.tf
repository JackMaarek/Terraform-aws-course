variable "access_key" {
  description = "API access key"
  type        = string
}

variable "secret_key" {
  description = "API secret key"
  type        = string
}

variable "bastion_local_key_path" {
  description = "Local path to the bastion key"
  type        = string
  default     = "~/.ssh/JA-Bastion.pem"
}

variable "vpc_cidr" {
  description = "CIDR main VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "bastion_key_name" {
  description = "Name of the keypair for Bastion host"
  type        = string
  default     = "JA_Bastion"
}