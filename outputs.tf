# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "arn_fastfood" {
  description = "AWS arn_fastfood"
  value       = var.arn_fastfood
}

#outputs.tf
output "security_group_id" {
  value       = aws_security_group.fastfooddb_security_group.id
}
output "db_instance_endpoint" {
  value       = aws_db_instance.fastfooddb.endpoint
}
