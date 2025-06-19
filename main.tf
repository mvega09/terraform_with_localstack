resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "main_dr" {
  provider   = aws.europa
  cidr_block = "172.16.0.0/16"
}