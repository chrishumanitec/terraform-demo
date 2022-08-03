
resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.cluster_id}-cache-subnet"
  subnet_ids = [var.subnet_id]
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = var.cluster_id
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  engine_version       = "6.2"
  port                 = 6379
  security_group_ids   = [var.access_security_group_id]
  subnet_group_name    = aws_elasticache_subnet_group.default.name
  tags = {
    source = var.source_tag
  }
}