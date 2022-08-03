output "host" {
  value = aws_elasticache_cluster.example.cache_nodes[0].address
}
output "port" {
  value = aws_elasticache_cluster.example.cache_nodes[0].port
}

output "username" {
  value     = "redis"
  sensitive = true
}

output "password" {
  value     = ""
  sensitive = true
}

