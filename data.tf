data "aws_vpc" "vpc-1" {
  id = "vpc-06b435df67d449932"
}

data "aws_subnet" "subnet-1" {
  id = "subnet-01aa6b5bcfa8ad4a9"
}
data "aws_security_group" "sg-terra" {
  id = "sg-0fd8d51722bfba63c"
}
