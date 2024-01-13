output "db_instance_endpoint_customer" {
  value = aws_db_instance.fastfooddb_customer.endpoint
}

output "db_instance_endpoint_order" {
  value = aws_db_instance.fastfooddb_order.endpoint
}

output "db_instance_endpoint_payment" {
  value = aws_db_instance.fastfooddb_payment.endpoint
}


output "mongo_endpoint" {
  value = mongodbatlas_cluster.my_cluster.connection_strings[0].standard
}