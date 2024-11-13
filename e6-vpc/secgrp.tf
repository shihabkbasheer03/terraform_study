resource "aws_security_group" "dove_stack_sg" {
  name        = "dove_stack_sg"
  description = "Sec Grp for dove ssh"
  vpc_id      = aws_vpc.dove.id

  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]

  }
  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = [var.MYIP]
  }

  tags = {
    Name = "allow_ssh"
  }
}