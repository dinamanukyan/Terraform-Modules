#Variable For AWS Region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table" {
  description = "DynamoDB table name for state locking"
  type        = string
  default     = "terraform-state-lock"
}

variable "allowed_ports" {
  type    = list(number)
  default = [22, 80]
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-08c40ec9ead489470"
  
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}