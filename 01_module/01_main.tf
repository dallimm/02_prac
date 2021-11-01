provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_key_pair" "hlpark_key" {
  key_name = "tf-key1"
	public_key = file("../../../.ssh/id_rsa.pub")
}

resource "aws_vpc" "hlpark_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "hlpark_vpc"
  }
}