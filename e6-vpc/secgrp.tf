resource "aws_security_group" "dove_stack_sg" {
  name        = "dove_stack_sg"
  description = "Sec Grp for dove ssh"
  vpc_id      = aws_vpc.dove.id

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group_rule" "allow_all_traffic_egress" {
  type              = "egress"
  security_group_id = aws_security_group.dove_stack_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  ip_protocol       = "-1"  # Allows all protocols and ports
}

resource "aws_security_group_rule" "allow_ssh_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.dove_stack_sg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.MYIP]
}
