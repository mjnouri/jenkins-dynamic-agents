output "publicip-jenkins-controller" {
  value = aws_instance.jenkins-controller.public_ip
}

output "publicip-jenkins-agent" {
  value = aws_instance.jenkins-agent[*].public_ip
}

output "privateip-jenkins-controller" {
  value = aws_instance.jenkins-controller.private_ip
}

output "privateip-jenkins-agent" {
  value = aws_instance.jenkins-agent[*].private_ip
}

# output "alb-url" {
#   value = aws_lb.jenkins_alb.dns_name
# }
