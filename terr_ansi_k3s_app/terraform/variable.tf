variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "ap-northeast-1"
}

# 更新される可能性があるので注意
variable "ubuntu"{
  type = "map"
  default = {
    "ubuntu18" = "ami-0cd744adeca97abb1" # ubuntu18.04
    "ubuntu16" = "ami-0f9af249e7fa6f61b" # ubuntu16.04
  }
}

variable "key_name" {
  description = "Desired name of AWS key pair"
}

variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/terraform.pub
DESCRIPTION
}
