provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "master" {
  ami                    = "${var.ubuntu["ubuntu18"]}" # ubuntu18.04
  instance_type          = "t3.medium"
  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = [
    "${aws_security_group.ansible_k3s_sg.id}"
  ]
  tags                   = {
    Name  = "master"
    Users = "haga"
  }
  root_block_device {
    volume_size          = 30
  }
}
resource "aws_instance" "worker" {
  ami                    = "${var.ubuntu["ubuntu18"]}" # ubuntu18.04
  instance_type          = "t3.medium"
  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = [
    "${aws_security_group.ansible_k3s_sg.id}"
  ]
  tags                   = {
    Name  = "worker"
    Users = "haga"
  }
  root_block_device {
    volume_size          = 20
  }
}
resource "aws_instance" "rancher" {
  ami                    = "${var.ubuntu["ubuntu18"]}" # ubuntu18.04
  instance_type          = "t3.medium"
  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = [
    "${aws_security_group.ansible_k3s_sg.id}"
  ]
  tags                   = {
    Name  = "rancher"
    Users = "haga"
  }
}

resource "aws_key_pair" "auth" {
  key_name = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}
