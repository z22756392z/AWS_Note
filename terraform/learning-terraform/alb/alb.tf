# target group
resource "aws_lb_target_group" "tg" {
  name        = "tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpc.id
}

# creating ALB
resource "aws_lb" "lb" {
  name               = "lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [for subnet in aws_subnet.subnets: subnet.id]
  security_groups    = [aws_security_group.sg_http.id]
  ip_address_type    = "ipv4"
  

  tags = {
    name = "lb"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2_attach" {
  count            = length(aws_instance.ec2_web)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        =  aws_instance.ec2_web[count.index].id
}
