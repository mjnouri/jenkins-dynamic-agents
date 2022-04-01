module "jenkins-infra" {
  source = "../jenkins-infra"
  instance_type = "t3.large"
  env = "Production"
}
