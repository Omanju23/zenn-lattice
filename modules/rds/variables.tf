variable "identifier" {
  description = "RDSインスタンスの識別子"
  type        = string
}

variable "vpc_id" {
  description = "RDSを配置するVPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "RDSサブネットグループのサブネットID"
  type        = list(string)
}

variable "instance_class" {
  description = "RDSインスタンスクラス"
  type        = string
  default     = "db.t3.micro"
}

variable "engine" {
  description = "RDSエンジンタイプ"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "RDSエンジンバージョン"
  type        = string
  default     = "13"
}

variable "allocated_storage" {
  description = "割り当てるストレージサイズ (GB)"
  type        = number
  default     = 20
}

variable "username" {
  description = "RDSマスターユーザー名"
  type        = string
}

variable "password_ssm_path" {
  description = "パスワードを保存するSSMパラメータパス"
  type        = string
}

variable "parameter_group_family" {
  description = "DBパラメータグループファミリー"
  type        = string
  default     = "postgres13"
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
