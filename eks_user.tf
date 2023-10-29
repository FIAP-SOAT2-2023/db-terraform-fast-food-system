
resource "aws_iam_user" "eks_user" {
  name = "eks-user"
}

resource "aws_iam_access_key" "eks_user_access_key" {
  user = aws_iam_user.eks_user.name
}

resource "aws_eks_cluster" "eks_cluster" {
  name = module.eks.cluster_name
 role_arn = aws_iam_role.example.arn
  vpc_config {
   subnet_ids = concat(module.vpc.private_subnets, module.vpc.public_subnets)
  }
}
