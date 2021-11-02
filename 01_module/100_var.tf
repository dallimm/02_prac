variable "name" {
  type = string
#  default = "hlpark"
}

variable "avazone" {
  type = list
 #  default = ["a","c"]
}

variable "region" {
  type = string
#   default = "ap-northeast-2"
}

variable "key" {
  type = string
 #  default = "tf-key1"
}

variable "cidr_main" {
  type = string
 #  default = "10.0.0.0/16"
}

variable "cidr" {
  type = string
#   default = "0.0.0.0/0"
}

variable "public_s" {
  type = list
#   default = ["10.0.0.0/24","10.0.2.0/24"]
}

variable "private_s" {
  type = list
 #  default = ["10.0.1.0/24","10.0.3.0/24"]
}

variable "private_ip" {
  type  = string
 # default = "10.0.0.11"
}
variable "private_dbs" {
  type = list
#   default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "tcp_proto" {
  type = string
# default = "tcp"
}

variable "cidr_blo" {
  type = string
# default = "::/0"
}

variable "icmp_proto" {
  type = string
# default = "icmp"
}

variable "egress_proto" {
  type = string
# default = "-1"
}

variable "ins-type" {
  type = string
# default = "t2.micro"
}


variable "ins-pro" {
  type = string
# default = "admin_role"
}