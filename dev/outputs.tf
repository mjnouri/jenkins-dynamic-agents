output "publicip-jenkins-controller" {
  value = module.jenkins-infra.publicip-jenkins-controller
}

output "publicip-jenkins-agent" {
  value = module.jenkins-infra.publicip-jenkins-agent
}

output "privateip-jenkins-controller" {
  value = module.jenkins-infra.privateip-jenkins-controller
}

output "privateip-jenkins-agent" {
  value = module.jenkins-infra.privateip-jenkins-agent
}

# output "alb-url" {
#   value = module.jenkins-infra.alb-url
# }
