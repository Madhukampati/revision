output "aws_vpc" {
  value = aws_vpc.vpc-1.id
}
output "aws_subnet" {
  value = aws_subnet.subnet-1.id
}
output "aws_security_group" {
  value = aws_security_group.sg-terra.id
}
