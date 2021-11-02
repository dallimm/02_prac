
resource "aws_security_group" "hlpark_websg" {
  name = "Allow-WEB"
  description = "http-ssh-icmp"
  vpc_id = aws_vpc.hlpark_vpc.id

  ingress = [
    {
      description = "ssh"
      from_port   = 22
      to_port     = 22
      protocol    = var.tcp_proto
      cidr_blocks  = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_blo]
      security_groups = null
      prefix_list_ids = null
      self            = null
    },

    {
      description = "http"
      from_port   = 80
      to_port     = 80
      protocol    = var.tcp_proto
      cidr_blocks  = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_blo]
      security_groups = null
      prefix_list_ids = null
      self            = null
    },

    {
      description = "icmp"
      from_port   = -1
      to_port     = -1
      protocol    = var.icmp_proto
      cidr_blocks  = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_blo]
      security_groups = null
      prefix_list_ids = null
      self            = null
    },
    {
      description = "mysql"
      from_port   = 3306
      to_port     = 3306
      protocol    = var.tcp_proto
      cidr_blocks  = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_blo]
      security_groups = null
      prefix_list_ids = null
      self            = null
    }
  ]
  egress = [ 
    {
      description = "All"
      from_port   = 0
      to_port     = 0
      protocol    = var.egress_proto
      cidr_blocks  = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_blo]
      security_groups = null
      prefix_list_ids = null
      self            = null
    }
    ]
  
  tags = {
    Name = "${var.name}-sg"
  }
}

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

  resource "aws_instance" "hlpark_weba" {
      ami               = data.aws_ami.amzn.id 
      instance_type = var.ins-type
      key_name = var.key
      vpc_security_group_ids = [aws_security_group.hlpark_websg.id]
      availability_zone = "ap-northeast-1a"
      private_ip = "192.168.0.11"
      subnet_id = aws_subnet.hlpark_pub[0].id
      user_data = file("./install_seoul.sh")

      tags = {
        Name = "${var.name}-weba"
      }
  }

resource "aws_eip" "hlpark_web_eip" {
  vpc = true
  instance = aws_instance.hlpark_weba.id
  associate_with_private_ip = "192.168.0.11"
  depends_on = [aws_internet_gateway.hlpark_ig]
}

