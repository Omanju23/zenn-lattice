variable "vpc_id" {
  description = "VPCエンドポイントを作成するVPC ID"
  type        = string
}

variable "vpc_name" {
  description = "VPCの名前（リソース名に使用）"
  type        = string
}

variable "subnet_ids" {
  description = "VPCエンドポイントを配置するサブネットID"
  type        = list(string)
}

variable "route_table_ids" {
  description = "GatewayエンドポイントのルートテーブルID"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
