variable "peering_name" {
  description = "VPCピアリング接続の名前"
  type        = string
}

variable "requester_vpc_id" {
  description = "ピアリングを要求するVPC ID"
  type        = string
}

variable "accepter_vpc_id" {
  description = "ピアリングを受け入れるVPC ID"
  type        = string
}

variable "requester_cidr_block" {
  description = "リクエスタVPCのCIDRブロック"
  type        = string
}

variable "accepter_cidr_block" {
  description = "アクセプタVPCのCIDRブロック"
  type        = string
}

variable "requester_route_table_ids" {
  description = "リクエスタVPCのルートテーブルID"
  type        = list(string)
}

variable "accepter_route_table_ids" {
  description = "アクセプタVPCのルートテーブルID"
  type        = list(string)
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
