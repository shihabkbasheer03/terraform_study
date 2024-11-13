variable REGION {
  default = "us-east-1"
}

variable ZONE1 {
  default = "us-east-1a"
}

variable ZONE2 {
  default = "us-east-1b"
}
variable ZONE3 {
  default = "us-east-1c"
}

variable AMIS {
  type = map
  default = {
    us-east-1 = "ami-063d43db0594b521b"
    us-east-2 = "ami-0fae88c1e6794aa17"
  }
}

variable USER {
  default = "ec2-user"
}

variable PUB_KEY {
  default = "dovekey.pub"
}

variable PRIV_KEY {
  default = "dovekey"
}

variable MYIP {
    default = "106.222.237.79/32"
}