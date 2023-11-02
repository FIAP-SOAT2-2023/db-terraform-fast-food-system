#variables.tf
/**/
variable "access_key" {
  description = "Access key to AWS console"
}

variable "secret_key" {
  description = "Secret key to AWS console"
}

variable "region" {
  description = "AWS region"
}

variable "nome_repositorio" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "arn_fastfood" {
  type = string
}


variable "lambda_name" {
  type = string
}