output "log_group_name" {
  description = "フローログのCloudWatch Logsグループ名"
  value       = aws_cloudwatch_log_group.flow_logs.name
}

output "flow_log_id" {
  description = "VPCフローログのID"
  value       = aws_flow_log.this.id
}

output "iam_role_arn" {
  description = "フローログ用のIAMロールARN"
  value       = aws_iam_role.flow_logs.arn
}
