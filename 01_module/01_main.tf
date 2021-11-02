provider "aws" {
  region = var.region
}

resource "aws_key_pair" "hlpark_key" {
  key_name = var.key
	public_key = file("../../../.ssh/id_rsa.pub")
}

resource "aws_vpc" "hlpark_vpc" {
  cidr_block = var.cidr_main
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "hlpark_pub" {
  vpc_id            = aws_vpc.hlpark_vpc.id
  count             = "${length(var.public_s)}" #2
  cidr_block        = "${var.public_s[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pub-${var.avazone[count.index]}"
  }
}

resource "aws_subnet" "hlpark_pri" {
  vpc_id            = aws_vpc.hlpark_vpc.id
  count             = "${length(var.private_s)}" 
  cidr_block        = "${var.private_s[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pri-${var.avazone[count.index]}"
  }
}

resource "aws_subnet" "hlpark_pridb" {
  vpc_id            = aws_vpc.hlpark_vpc.id
  count             = "${length(var.private_dbs)}" 
  cidr_block        = "${var.private_dbs[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pridb-${var.avazone[count.index]}"
  }
}


