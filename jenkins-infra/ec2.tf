data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkins-controller" {
  ami                    = data.aws_ami.ubuntu.id
  iam_instance_profile   = aws_iam_instance_profile.jenkins-controller-instance-profile.name
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.jenkins_public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg_8080.id, aws_security_group.jenkins_sg_22.id, aws_security_group.jenkins_sg_8080_vpc.id]
  key_name               = var.key_name
  user_data              = file("../jenkins-infra/install-jenkins.sh")
  tags = {
    Name         = "jenkins-controller"
    Linux_Distro = "Ubuntu"
    Environment  = var.env
  }
}

resource "aws_instance" "jenkins-agent" {
  count                  = (var.env == "Production") ? 2 : 1
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.jenkins_public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg_22.id, aws_security_group.jenkins_sg_22_vpc.id]
  key_name               = "mark-test"
  tags = {
    Name         = "jenkins-agent${count.index}"
    Linux_Distro = "Ubuntu"
    Environment  = var.env
  }
}
