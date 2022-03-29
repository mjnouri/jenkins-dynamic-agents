output "publicip-jenkins-master" {
  value = aws_instance.jenkins-master.public_ip
}

output "publicip-jenkins-slave1" {
  value = aws_instance.jenkins-slave1.public_ip
}

output "publicip-jenkins-slave2" {
  value = aws_instance.jenkins-slave2.public_ip
}

output "privateip-jenkins-master" {
  value = aws_instance.jenkins-master.private_ip
}

output "privateip-jenkins-slave1" {
  value = aws_instance.jenkins-slave1.private_ip
}

output "privateip-jenkins-slave2" {
  value = aws_instance.jenkins-slave2.private_ip
}

# output "alb-url" {
#   value = aws_lb.jenkins_alb.dns_name
# }
