
resource "aws_iam_user" "eks_user" {
  name = "eks-user"
}

resource "aws_iam_access_key" "eks_user_access_key" {
  user = aws_iam_user.eks_user.name
}

