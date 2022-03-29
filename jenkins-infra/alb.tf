# resource "aws_lb_target_group" "jenkins_tg" {
#   name     = "jenkinstg"
#   port     = 8080
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.jenkins_vpc.id
#   health_check {
#     healthy_threshold   = 2
#     interval            = 5
#     timeout             = 2
#     unhealthy_threshold = 2
#     path                = "/login?from=%2F"
#   }
# }
# 
# resource "aws_lb_target_group_attachment" "jenkins_tg_attach" {
#   target_group_arn = aws_lb_target_group.jenkins_tg.arn
#   target_id        = aws_instance.jenkins-master.id
#   port             = 8080
# }
# 
# resource "aws_lb" "jenkins_alb" {
#   name               = "jenkinsalb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.jenkins_sg_80.id]
#   subnets            = [aws_subnet.jenkins_public_subnet_1.id, aws_subnet.jenkins_public_subnet_2.id, aws_subnet.jenkins_public_subnet_3.id]
# 
#   tags = {
#     Name = "jenkins_alb"
#   }
# }
# 
# resource "aws_lb_listener" "jenkins_alb_listener" {
#   load_balancer_arn = aws_lb.jenkins_alb.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.jenkins_tg.arn
#   }
# }