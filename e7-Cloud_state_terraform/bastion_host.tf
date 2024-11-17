resource "aws_instance" "vprofile-bastion" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.vprofilekey.key_name
  subnet_id = module.vpc.public_subnets[0]
  count = var.instance_count
  vpc_security_group_ids = [aws_security_group.vprofile-bastin-sg.id]
  tags = {
    Name = "vprofile-bastion"
    PROJECT = "vprofile"
  }

  provisioner "file" {
    content = templatefile("template/db-deploy.tmpl", {rds-endpoint = aws_db_instance.vprofile-rds.address, dbuser = var.dbuser, dbpass = var.dbpass} )
    destination = "/tmp/vprofile-dbdeploy.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x vprofile-dbdeploy.sh",
      "sudo /tmp/vprofile-dbdeploy.sh"
    ]
  }
  connection {
    user = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
  }

}