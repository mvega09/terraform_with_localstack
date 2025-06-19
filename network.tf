# description: This Terraform configuration sets up a VPC with three subnets in different availability zones
/*
components of my network infrastructure
-vpc: 10.0.0.0/16
  -subnet1: 10.0.10.0/24
  -subnet2: 10.0.20.0/24
  -subnet3: 10.0.30.0/24

  -internet gateway
  -route table
  -nat gateway
*/
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "sub_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "sub_1-subnet"
  }
}

resource "aws_subnet" "sub_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "sub_2-subnet"
  }
}

resource "aws_subnet" "sub_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.30.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "sub_3-subnet"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
}

resource "aws_route_table_association" "sub_1" {
  subnet_id      = aws_subnet.sub_1.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_route_table_association" "sub_2" {
  subnet_id      = aws_subnet.sub_2.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_route_table_association" "sub_3" {
  subnet_id      = aws_subnet.sub_3.id
  route_table_id = aws_route_table.main_rt.id
}