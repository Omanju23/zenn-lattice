variable "function_name" {
  description = "Lambda関数の名前"
  type        = string
}

variable "vpc_id" {
  description = "Lambdaを配置するVPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Lambdaを実行するサブネットID"
  type        = list(string)
}

variable "runtime" {
  description = "Lambda関数のランタイム"
  type        = string
  default     = "nodejs18.x"
}

variable "memory_size" {
  description = "Lambda関数のメモリサイズ(MB)"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Lambda関数のタイムアウト(秒)"
  type        = number
  default     = 10
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
