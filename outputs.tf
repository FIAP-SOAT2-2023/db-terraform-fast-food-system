# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "arn_fastfood" {
  description = "AWS arn_fastfood"
  value       = var.arn_fastfood
}

#outputs.tf
output "security_group_id" {
  value = aws_security_group.fastfooddb_security_group.id
}
output "db_instance_endpoint" {
  value = aws_db_instance.fastfooddb.endpoint
}
