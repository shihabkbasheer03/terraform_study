module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

    name = var.VPC_NAME
    cidr = var.VpcCIDR
    azs = [var.ZONE1, var.ZONE2, var.ZONE3]
    private_subnets = [var.PriSub1CIDR, var.PriSub2CIDR, var.PriSub3CIDR]
    public_subnets = [var.PubSub1CIDR, var.PubSub2CIDR, var.PubSub3CIDR]
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Terraform = "true"
        Environment = "Prod"
    }
    vpc_tags = {
        Name = var.VPC_NAME
    }
}

