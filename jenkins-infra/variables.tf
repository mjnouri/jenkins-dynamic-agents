variable "project_name" {
  default = "jenkins"
}

variable "my_ip" {
  default = ""
}

variable "instance_type" {
  default = ""
}

variable "key_name" {
  default = "mark-test"
}

variable "env" {
  default = ""
}

variable "public_subnet_cidr" {
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}

variable "private_subnet_cidr" {
  default = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
}

variable "az" {
  default = [ "us-east-1a", "us-east-1b" , "us-east-1c" ]
}
