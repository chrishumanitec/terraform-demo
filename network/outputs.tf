output "vpc_id" {
  value = aws_vpc.main.id
}

output "redis_subnet_id" {
  value = aws_subnet.redis.id
}

output "vpc_access_secruity_group_id" {
  value = aws_security_group.platform_vpc.id
}