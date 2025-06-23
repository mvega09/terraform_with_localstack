variable "server_type" {
    type        = string
    description = "instance type for the web server"
    default     = "t2.nano"
}

variable "server_count" {
    type        = number
    description = "number of web servers to create"
    default     = 1
}

variable "create_igw" {
    type        = bool
    description = "whether to create an internet gateway"
    default     = true
}

variable "incluide_ipv4" {
    type        = bool
    description = "whether to include IPv4 CIDR block in the VPC"
    default     = true
}

variable "availability_zones" {
    type        = list(string)
    description = "list of availability zones to use for the subnets"
    default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}