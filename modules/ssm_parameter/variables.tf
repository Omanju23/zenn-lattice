variable "parameter_name" {
  description = "SSMパラメータの名前（パス）"
  type        = string
}

variable "parameter_value" {
  description = "SSMパラメータの値"
  type        = string
  sensitive   = true
}

variable "parameter_type" {
  description = "SSMパラメータのタイプ"
  type        = string
  default     = "SecureString"
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
