output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table used for state locking"
  value       = aws_dynamodb_table.terraform_locks.arn
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.main.id
}

output "internet_gateway_id" {
  description = "ID of the created Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.instance_sg.id
}

output "ec2_instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.ec2_instances[*].id
}