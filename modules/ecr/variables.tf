variable "repository_name" {
  description = "ECRリポジトリの名前"
  type        = string
}

variable "image_tag_mutability" {
  description = "イメージタグの変更可否設定"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "プッシュ時にイメージスキャンを実行するかどうか"
  type        = bool
  default     = true
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
