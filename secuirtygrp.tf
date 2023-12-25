resource "aws_security_group" "beanstalk_elb_sg" {
  vpc_id      = module.vpc.vpc_id
  name        = "beanstalk_elb_sg"
  description = "Security Group for Beanstalk load balancer"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Bastion_host_sg" {
  name        = "Bastion_host_sg"
  vpc_id      = module.vpc.vpc_id
  description = "Security Group for Bastion Host"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
}

resource "aws_security_group" "beanstalk_instance_sg" {
  name        = "beanstalk_instance_sg"
  vpc_id      = module.vpc.vpc_id
  description = "Security Group for Instances under Beanstlak"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.Bastion_host_sg.id]
  }
}

resource "aws_security_group" "backend_services_sg" {
  name        = "backend_services_sg"
  vpc_id      = module.vpc.vpc_id
  description = "Secuirty group for backend Services"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.beanstalk_instance_sg.id]
  }
}

resource "aws_security_group_rule" "Secuirty_group_rule" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_services_sg.id
  source_security_group_id = aws_security_group.backend_services_sg.id

}