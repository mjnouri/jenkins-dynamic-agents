resource "aws_vpc" "jenkins_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "jenkins_vpc"
  }
}

resource "aws_internet_gateway" "jenkins_gateway" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags = {
    Name = "jenkins_ig"
  }
}

resource "aws_route_table" "jenkins_public_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_gateway.id
  }
  tags = {
    Name = "jenkins_public_rt"
  }
}

resource "aws_route_table" "jenkins_private_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id
  route  = []
  tags = {
    Name = "jenkins_private_rt"
  }
}

resource "aws_subnet" "jenkins_public_subnet_1" {
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "jenkins_public_subnet_1"
  }
}

resource "aws_subnet" "jenkins_public_subnet_2" {
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "jenkins_public_subnet_2"
  }
}

resource "aws_subnet" "jenkins_public_subnet_3" {
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "jenkins_public_subnet_3"
  }
}

resource "aws_subnet" "jenkins_private_subnet_1" {
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "jenkins_private_subnet_1"
  }
}

resource "aws_subnet" "jenkins_private_subnet_2" {
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "jenkins_private_subnet_2"
  }
}

resource "aws_subnet" "jenkins_private_subnet_3" {
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "jenkins_private_subnet_3"
  }
}

resource "aws_route_table_association" "public_subnet_1_route_table_assoc" {
  subnet_id      = aws_subnet.jenkins_public_subnet_1.id
  route_table_id = aws_route_table.jenkins_public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_route_table_assoc" {
  subnet_id      = aws_subnet.jenkins_public_subnet_2.id
  route_table_id = aws_route_table.jenkins_public_rt.id
}

resource "aws_route_table_association" "public_subnet_3_route_table_assoc" {
  subnet_id      = aws_subnet.jenkins_public_subnet_3.id
  route_table_id = aws_route_table.jenkins_public_rt.id
}

resource "aws_route_table_association" "private_subnet_1_route_table_assoc" {
  subnet_id      = aws_subnet.jenkins_private_subnet_1.id
  route_table_id = aws_route_table.jenkins_private_rt.id
}

resource "aws_route_table_association" "private_subnet_2_route_table_assoc" {
  subnet_id      = aws_subnet.jenkins_private_subnet_2.id
  route_table_id = aws_route_table.jenkins_private_rt.id
}

resource "aws_route_table_association" "private_subnet_3_route_table_assoc" {
  subnet_id      = aws_subnet.jenkins_private_subnet_3.id
  route_table_id = aws_route_table.jenkins_private_rt.id
}

