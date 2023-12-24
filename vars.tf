variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1  = "ami-0c7217cdde317cfec"
    us-east-2  = "ami-0c7217cdde317cfec"
    ap-south-1 = "ami-0c7217cdde317cfec"
  }

}

variable "vpc_name" {
  default = "main_vpc"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "vpc_CIDR" {
  default = "172.21.0.0/16"
}

variable "PUBSUB1_CIDR" {
  default = "172.21.1.0/24"
}

variable "PUBSUB2_CIDR" {
  default = "172.21.2.0/24"
}

variable "PUBSUB3_CIDR" {
  default = "172.21.3.0/24"
}

variable "PRIVSUB1_CIDR" {
  default = "172.21.4.0/24"
}

variable "PRIVSUB2_CIDR" {
  default = "172.21.5.0/24"
}

variable "PRIVSUB3_CIDR" {
  default = "172.21.6.0/24"
}

variable "rmq_user" {
  default = "rabbit"

}

variable "rmq_pass" {
  default = "Grr3n@ppl333"
}

variable "db_user" {
  default = "rohit"
}

variable "db_pass" {
  default = "list3n"
}

variable "Public_key" {
  default = "main_key.pub"
}

variable "Private_key" {
  default = "main_key"
}

variable "USER" {
  default = "ubuntu"

}

variable "MYIP" {
  default = "110.235.216.23/32"

}