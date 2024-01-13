/*
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform_state"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
*/

/*
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "terraform-state-db-fast-food-system"
  lifecycle {
    prevent_destroy = true
  }

}
*/

/*
resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  acl    = "private"
}
*/

/*
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
*/