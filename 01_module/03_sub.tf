resource "aws_subnet" "hlpark_puba" {
  vpc_id            = aws_vpc.hlpark_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "hlpark-puba"
  }
}

resource "aws_subnet" "hlpark_pria" {
  vpc_id            = aws_vpc.hlpark_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "hlpark-pria"
  }
}

resource "aws_subnet" "hlpark_pubc" {
  vpc_id            = aws_vpc.hlpark_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "hlpark-pubc"
  }
}

resource "aws_subnet" "hlpark_pric" {
  vpc_id            = aws_vpc.hlpark_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "hlpark-pric"
  }
}