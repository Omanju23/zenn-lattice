output "vpc_id" {
  description = "作成されたVPCのID"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "VPCのCIDRブロック"
  value       = aws_vpc.this.cidr_block
}

output "private_subnet_ids" {
  description = "プライベートサブネットのID"
  value       = aws_subnet.private[*].id
}

output "private_route_table_ids" {
  description = "プライベートルートテーブルのID"
  value       = aws_route_table.private[*].id
}
