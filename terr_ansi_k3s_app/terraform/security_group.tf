resource "aws_security_group" "ansible_k3s_sg"{
  name = "ansible_k3s_sg"
  # ssh
  ingress{
  from_port  = 22
  to_port    = 22
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  # http
  ingress{
  from_port  = 80
  to_port    = 80
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  # http
  ingress{
  from_port  = 8080
  to_port    = 8080
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
  }
  # k3sの連携のため
  ingress{
  from_port  = 6443
  to_port    = 6443
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  # RancherGUIのため
  ingress{
  from_port  = 449
  to_port    = 449
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  # nodePort用
  ingress{
  from_port  = 31656
  to_port    = 31656
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  # docker registry
  ingress{
    from_port  = 5000
    to_port    = 5000
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
  from_port  = 0
  to_port    = 0
  protocol   = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  description = "allow tcp 22, 449, 8080, 8088 and 31656 "
}
