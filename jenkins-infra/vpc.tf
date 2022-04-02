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

resource "aws_subnet" "jenkins_public_subnet" {
  count                   = (var.env == "Production") ? 3 : 2
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.az[count.index]
  map_public_ip_on_launch = "true"
  tags = {
    Name = "jenkins_public_subnet_${count.index}"
  }
}

resource "aws_subnet" "jenkins_private_subnet" {
  count             = (var.env == "Production") ? 3 : 2
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.az[count.index]
  tags = {
    Name = "jenkins_private_subnet_${count.index}"
  }
}

resource "aws_route_table_association" "public_subnet_route_table_assoc" {
  count          = (var.env == "Production") ? 3 : 2
  subnet_id      = aws_subnet.jenkins_public_subnet[count.index].id
  route_table_id = aws_route_table.jenkins_public_rt.id
}

resource "aws_route_table_association" "private_subnet_route_table_assoc" {
  count          = (var.env == "Production") ? 3 : 2
  subnet_id      = aws_subnet.jenkins_private_subnet[count.index].id
  route_table_id = aws_route_table.jenkins_private_rt.id
}
