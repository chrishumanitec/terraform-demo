resource "aws_vpc" "main" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "TeamAVPC"
  }
}

resource "aws_subnet" "redis" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.1.0/24"

  tags = {
    Name = "Redis"
  }
}

resource "aws_security_group" "platform_vpc" {
  name        = "allow-from-platform-team-vpc"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "From Platform Team VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [ "10.1.0.0/16" ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-from-platform-team-vpc"
  }
}

