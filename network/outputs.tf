output "vpc_id" {
  value = aws_vpc.main.id
}

output "redis_subnet_id" {
  value = aws_subnet.redis.id
}