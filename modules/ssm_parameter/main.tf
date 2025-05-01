# SSMパラメータ
resource "aws_ssm_parameter" "this" {
  name        = var.parameter_name
  description = "マネージドパラメータ: ${var.parameter_name}"
  type        = var.parameter_type
  value       = var.parameter_value
  
  tags = var.tags
}
