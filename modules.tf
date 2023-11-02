################################################################################
# module irsa-ebs-csi
################################################################################
/*
module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"

  create_role                   = true
  role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
  provider_url                  = module.eks.oidc_provider
  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}
*/

################################################################################
# module eks
################################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true



  //eks_managed_node_group_defaults = {
  //    ami_type = "ami-01bc990364452ab3e"

  //}
  /*
   eks_managed_node_groups = {
     one = {
       name = "node-group-1"

       instance_types = ["t3.xlarge"]

       min_size     = 1
       max_size     = 1
       desired_size = 1
     }


     two = {
       name = "node-group-2"

       instance_types = ["t3.small"]

       min_size     = 1
       max_size     = 2
       desired_size = 1
     }

  }
  */
}

################################################################################
# module vpc
################################################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "fastfood-vpc"

  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  //public_subnets  = ["10.0.4.0/24"]
  //private_subnets = ["10.0.1.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }

  create_database_subnet_group = true

  database_subnets = ["10.0.7.0/24", "10.0.8.0/24"]
}