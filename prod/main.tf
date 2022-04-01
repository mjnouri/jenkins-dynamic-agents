module "jenkins-infra" {
  source = "../jenkins-infra"
  instance_type = "t3.medium"
  env = "Production"
}
