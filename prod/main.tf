module "jenkins-infra" {
  source = "../jenkins-infra"
  instance_type = "t3.medium"
  env = "Production"
  my_ip = var.my_ip
}
