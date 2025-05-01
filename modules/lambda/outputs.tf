output "function_name" {
  description = "Lambda関数の名前"
  value       = aws_lambda_function.this.function_name
}

output "function_arn" {
  description = "Lambda関数のARN"
  value       = aws_lambda_function.this.arn
}

output "invoke_arn" {
  description = "Lambda関数の呼び出しARN"
  value       = aws_lambda_function.this.invoke_arn
}

output "function_url" {
  description = "Lambda関数のURL"
  value       = aws_lambda_function_url.this.function_url
}

output "security_group_id" {
  description = "Lambda関数のセキュリティグループID"
  value       = aws_security_group.lambda.id
}
