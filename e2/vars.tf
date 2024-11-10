variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map
  default = {
    us-east-1 = "ami-063d43db0594b521b"
    us-east-2 = "ami-0fae88c1e6794aa17"
  }
}
