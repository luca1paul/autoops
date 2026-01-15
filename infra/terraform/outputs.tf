# outputs.tf

# These were used for AWS-based resources (disabled for local learning)
# output "vpc_id" {
#   value = aws_vpc.main.id
# }

# output "public_ip" {
#   value = aws_instance.autoops_server.public_ip
# }

# output "subnet_id" {
#   value = aws_subnet.public_subnet.id
# }

# Local simulation outputs
output "mock_vpc" {
  value = null_resource.mock_vpc.id
}

output "mock_instance" {
  value = null_resource.mock_instance.id
}
