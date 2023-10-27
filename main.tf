#main.tf
#defining the provider as aws
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.22.0"
    }
  }

  required_version = ">= 0.14.9"
}
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
## 
##data "aws_eks_cluster" "default" {
  ##name = var.cluster_name
##}
##
data "aws_eks_cluster_auth" "default" {
  name = var.cluster_name
}

provider "kubernetes" {
  ##host                   = data.aws_eks_cluster.default.endpoint
  ##cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
  ##token                  = data.aws_eks_cluster_auth.default.token
}

#create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine                 = "mysql"
  identifier             = "myrdsinstance"
  allocated_storage      = 20
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "myrdsuser"
  password               = "myrdspassword"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true
  publicly_accessible    = true
}