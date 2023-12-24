module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_CIDR

  azs             = [var.ZONE1, var.ZONE2, var.ZONE3]
  public_subnets  = [var.PUBSUB1_CIDR, var.PUBSUB2_CIDR, var.PUBSUB3_CIDR]
  private_subnets = [var.PRIVSUB1_CIDR, var.PRIVSUB2_CIDR, var.PRIVSUB3_CIDR]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name        = "terra_vpc"
    environment = "PROD"

  }

  vpc_tags = {
    Name = var.vpc_name
  }


}