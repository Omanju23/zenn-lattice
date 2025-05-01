variable "vpc_name" {
  description = "VPCの名前"
  type        = string
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "availability_zones" {
  description = "使用するアベイラビリティゾーン"
  type        = list(string)
}

variable "public_subnet_suffix" {
  description = "パブリックサブネットの名前の接尾辞"
  type        = string
  default     = "public"
}

variable "private_subnet_suffix" {
  description = "プライベートサブネットの名前の接尾辞"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
