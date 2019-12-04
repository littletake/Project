provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "master" {
  ami                    = "ami-09b68f5653871885f" # ubuntu18.04
  instance_type          = "t3.medium"
  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = [
    "${aws_security_group.ansible_k3s_sg.id}"
  ]
  tags                   = {
    Name  = "master"
    Users = "haga"
  }
}
resource "aws_instance" "node1" {
  ami                    = "ami-09b68f5653871885f" # ubuntu18.04
  instance_type          = "t3.medium"
  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = [
    "${aws_security_group.ansible_k3s_sg.id}"
  ]
  tags                   = {
    Name  = "node1"
    Users = "haga"
  }
}
resource "aws_instance" "node2" {
  ami                    = "ami-09b68f5653871885f" # ubuntu18.04
  instance_type          = "t3.medium"
  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = [
    "${aws_security_group.ansible_k3s_sg.id}"
  ]
  tags                   = {
    Name  = "node2"
    Users = "haga"
  }
}

resource "aws_key_pair" "auth" {
  key_name = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}
