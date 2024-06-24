resource "aws_vpc" "vpc-1" {
  cidr_block = "10.6.0.0/16"
  tags = {
    Name = "vpc-1"
  }
}
resource "aws_subnet" "subnet-1" {
  vpc_id            = data.aws_vpc.vpc-1.id
  cidr_block        = "10.6.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-1"
  }
}
resource "aws_internet_gateway" "IGW-TERA" {
  vpc_id = data.aws_vpc.vpc-1.id
  tags = {
    Name = "IGW-TERRA"
  }
}
resource "aws_route_table" "rt-terra" {
  vpc_id = data.aws_vpc.vpc-1.id
  tags = {
    Name = "rt-terra-1"
  }
  #This is the exactly route table
  route {
    cidr_block = "10.6.0.0/16"
    gateway_id = "local"
  }
}
resource "aws_security_group" "sg-terra" {
  name   = "allow"
  vpc_id = data.aws_vpc.vpc-1.id
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "sg-terra-1"
  }
}
resource "aws_instance" "web-2" {
  ami = "ami-0230bd60aa48260c6"
  #ami = "ami-0d857ff0f5fc4e03b"
  #ami = "${data.aws_ami.my_ami.id}"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "keys"
  subnet_id                   = data.aws_subnet.subnet-1.id
  vpc_security_group_ids      = [data.aws_security_group.sg-terra.id]
  associate_public_ip_address = true
  tags = {
    Name  = "Server-1"
    Env   = "Prod"
    Owner = "Sree"

  }
}
