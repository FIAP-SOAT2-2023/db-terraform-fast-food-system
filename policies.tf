
resource "aws_iam_role" "example" {
  name = "exemplo-papel-eks"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
/*
data "aws_eks_cluster_auth" "example" {
  name = aws_eks_cluster.eks_cluster.name
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name = "aws-auth"
  }

  data = {
    mapRoles = <<EOF
- rolearn: ${aws_iam_role.example.arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
EOF
  }
}
*/
