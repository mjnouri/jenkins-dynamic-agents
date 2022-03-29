output "publicip-jenkins-master" {
  value = module.jenkins-infra.publicip-jenkins-master
}

output "publicip-jenkins-slave1" {
  value = module.jenkins-infra.publicip-jenkins-slave1
}

output "publicip-jenkins-slave2" {
  value = module.jenkins-infra.publicip-jenkins-slave2
}

output "privateip-jenkins-master" {
  value = module.jenkins-infra.privateip-jenkins-master
}

output "privateip-jenkins-slave1" {
  value = module.jenkins-infra.privateip-jenkins-slave1
}

output "privateip-jenkins-slave2" {
  value = module.jenkins-infra.privateip-jenkins-slave2
}

# output "alb-url" {
#   value = module.jenkins-infra.alb-url
# }
