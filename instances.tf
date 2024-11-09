resource "aws_instance" "dove-inst" {
    ami = var.AMIS[var.REGION]
    availability_zone = var.ZONE1
    key_name = "dove-key"
    vpc_security_group_ids = ["sg-0cf73c9432178f577"]
    tags = {
        Name = "Dove-instances"
        Projects = "Dove"
    }
}