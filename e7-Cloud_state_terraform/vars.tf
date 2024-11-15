variable AWS_REGION {
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
    us-east-3 = "ami-063d43db0594b521b"
    us-east-1 = "ami-0866a3c8686eaeeba"
    us-east-2 = "ami-0fae88c1e6794aa17"
  }
}

variable USER {
  default = "ubuntu"
}

variable PUB_KEY {
  default = "dovekey.pub"
}

variable PRIV_KEY {
  default = "dovekey"
}

variable MYIP {
    default = "115.245.213.196/32"
}

variable rmquser {
   default = "rabbit"
}

variable rmqpass {
  default = "Qub3Dynamics@123"
}

variable dbuser {
  default = "admin"
}

variable dbpass {
  default = "admin123"
}

variable dbname {
  default = "accounts"
}

variable instance_count {
  default = "1"
}

variable VPC_NAME {
  default = "vprofile-VPC"

}

variable VpcCIDR {
  default = "172.21.0.0/16"
}

variable PubSub1CIDR {
  default = "172.21.1.0/24"
}
variable PubSub2CIDR {
  default = "172.21.2.0/24"
}
variable PubSub3CIDR {
  default = "172.21.3.0/24"
}
variable PriSub1CIDR {
  default = "172.21.4.0/24"
}
variable PriSub2CIDR {
  default = "172.21.5.0/24"
}
variable PriSub3CIDR {
  default = "172.21.6.0/24"
}