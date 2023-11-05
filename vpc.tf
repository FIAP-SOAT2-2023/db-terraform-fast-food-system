################################################################################
# module vpc
################################################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "fastfood-vpc"

  cidr = local.vpc_cidr
  azs  = local.azs

  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  //public_subnets  = ["10.0.4.0/24"]
  //private_subnets = ["10.0.1.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  create_database_subnet_group = true

  database_subnets = ["10.0.80.0/24", "10.0.81.0/24"]

  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  enable_dns_support = true
}