resource "aws_security_group" "dove_stack_sg" {
  name        = "dove_stack_sg"
  description = "Sec Grp for dove ssh"
  vpc_id      = aws_vpc.dove.id



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}  

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.dove_stack_sg.id
  cidr_ipv4         = aws_vpc.dove.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

  tags = {
    Name = "allow_ssh"
  }
}