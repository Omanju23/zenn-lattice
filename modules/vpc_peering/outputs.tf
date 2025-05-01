output "vpc_peering_id" {
  description = "作成されたVPCピアリング接続のID"
  value       = aws_vpc_peering_connection.this.id
}

output "vpc_peering_status" {
  description = "VPCピアリング接続のステータス"
  value       = aws_vpc_peering_connection.this.accept_status
}
