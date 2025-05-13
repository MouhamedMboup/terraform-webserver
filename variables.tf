variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_ami" {
  description = "AMI ID for Ubuntu 24.04 in us-east-1"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "terraform-key"
  type        = string
}
