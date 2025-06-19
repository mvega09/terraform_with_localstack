variable "instance_type" {
  type        = string #boolean, string, number, list, map, object
  description = "Type of instance to use"
  default     = "c5.large"
}

resource "aws_instance" "web" {
  ami           = "ami-005e54dee72cc1235"
  instance_type = var.instance_type
}

output "web_id" {
  value       = aws_instance.web.arn
}

data "aws_region" "current" {}

resource "aws_instance" "web1" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = var.instance_type
}

output region {
  value       = data.aws_region.current.name
}



