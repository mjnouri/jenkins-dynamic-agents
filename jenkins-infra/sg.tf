resource "aws_security_group" "jenkins_sg_8080" {
  name = "${var.project_name}-${var.env}-sg-8080-me"

  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "jenkins_sg_22" {
  name = "${var.project_name}-${var.env}-sg-22-me"

  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "jenkins_sg_8080_vpc" {
  name = "${var.project_name}-${var.env}-sg-8080-vpc"

  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "jenkins_sg_22_vpc" {
  name = "${var.project_name}-${var.env}-sg-22-vpc"

  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "jenkins_sg_80" {
  name = "${var.project_name}-${var.env}-sg-80-me"

  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
