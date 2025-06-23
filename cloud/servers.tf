resource "aws_security_group" "main_sg" {
  name        = "main-security-group"
  description = "Main security group for the VPC"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}    

resource "aws_instance" "web_srv" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.server_type
  subnet_id   = aws_subnet.sub_1.id

  associate_public_ip_address = var.incluide_ipv4  
  tags = {
    Name = "HelloWorld"
  }
}