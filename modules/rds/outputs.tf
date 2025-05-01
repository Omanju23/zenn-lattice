output "instance_id" {
  description = "RDSインスタンスのID"
  value       = aws_db_instance.this.id
}

output "instance_address" {
  description = "RDSインスタンスのエンドポイントアドレス"
  value       = aws_db_instance.this.address
}

output "instance_endpoint" {
  description = "RDSインスタンスのエンドポイント"
  value       = aws_db_instance.this.endpoint
}

output "security_group_id" {
  description = "RDSインスタンスのセキュリティグループID"
  value       = aws_security_group.rds.id
}

output "db_name" {
  description = "RDSインスタンスのデータベース名"
  value       = aws_db_instance.this.db_name
}

output "username" {
  description = "RDSインスタンスのマスターユーザー名"
  value       = aws_db_instance.this.username
}

output "password_ssm_path" {
  description = "RDSインスタンスのパスワードが保存されているSSMパラメータパス"
  value       = aws_ssm_parameter.password.name
}
