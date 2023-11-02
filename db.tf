/*
module "vpc_rds" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name                 = "rds_vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  create_database_subnet_group = true

  database_subnets = [ "10.0.7.0/24", "10.0.8.0/24"]

}
*/



/* aws ec2 create-default-vpc */
resource "aws_security_group" "fastfooddb_security_group" {
  name   = "fastfooddb_security_group"
  vpc_id = module.vpc.vpc_id

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

resource "aws_db_subnet_group" "fastfooddb_subnet" {
  name       = "fastfooddb_subnet"
  subnet_ids = module.vpc.public_subnets
  tags = {
    Name = "Education"
  }
}
/**/

#create a RDS Database Instance
resource "aws_db_instance" "fastfooddb" {
  engine                 = "mysql"
  engine_version         = "8.0.28"
  identifier             = "fastfooddb"

  allocated_storage      = 20
  instance_class         = "db.r5.xlarge"
  username               = "adminfastfood"
  password               = "SOAT47fastfood"
  //parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.fastfooddb_security_group.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
  db_subnet_group_name   = module.vpc.database_subnet_group_name

}