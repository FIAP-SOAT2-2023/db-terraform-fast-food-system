resource "aws_ecr_repository" "fastfoodsystem" {
  provider = aws.us_east_1

  name = "fastfoodsystem"

  tags = {
    env = "production"
  }
}