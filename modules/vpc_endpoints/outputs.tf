output "vpc_endpoint_s3_id" {
  description = "S3 VPCエンドポイントのID"
  value       = aws_vpc_endpoint.s3.id
}

output "vpc_endpoint_ecr_api_id" {
  description = "ECR API VPCエンドポイントのID"
  value       = aws_vpc_endpoint.ecr_api.id
}

output "vpc_endpoint_ecr_dkr_id" {
  description = "ECR Docker VPCエンドポイントのID"
  value       = aws_vpc_endpoint.ecr_dkr.id
}

output "vpc_endpoint_logs_id" {
  description = "CloudWatch Logs VPCエンドポイントのID"
  value       = aws_vpc_endpoint.logs.id
}

output "security_group_id" {
  description = "VPCエンドポイント用セキュリティグループのID"
  value       = aws_security_group.vpc_endpoints.id
}
