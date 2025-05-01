output "parameter_arn" {
  description = "SSMパラメータのARN"
  value       = aws_ssm_parameter.this.arn
}

output "parameter_name" {
  description = "SSMパラメータの名前"
  value       = aws_ssm_parameter.this.name
}

output "parameter_version" {
  description = "SSMパラメータのバージョン"
  value       = aws_ssm_parameter.this.version
}
