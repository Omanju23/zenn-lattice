variable "vpc_id" {
  description = "フローログを設定するVPC ID"
  type        = string
}

variable "vpc_name" {
  description = "VPCの名前（ロググループ名に使用）"
  type        = string
}

variable "retention_in_days" {
  description = "ログの保持日数"
  type        = number
  default     = 7
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
