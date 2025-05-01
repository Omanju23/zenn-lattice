variable "cluster_name" {
  description = "ECSクラスターの名前"
  type        = string
}

variable "container_image" {
  description = "コンテナのイメージURL"
  type        = string
  default     = "nginx:latest"  # デフォルトはDockerHubのnginx、ECRが設定されていれば上書き
}

variable "service_name" {
  description = "ECSサービスの名前"
  type        = string
}

variable "vpc_id" {
  description = "ECSサービスを配置するVPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "タスクを実行するサブネットID"
  type        = list(string)
}

variable "container_port" {
  description = "コンテナのポート"
  type        = number
  default     = 80
}

variable "desired_count" {
  description = "実行するタスクの数"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "タスク定義のCPU"
  type        = number
  default     = 256
}

variable "memory" {
  description = "タスク定義のメモリ"
  type        = number
  default     = 512
}

variable "tags" {
  description = "リソースに追加するタグ"
  type        = map(string)
  default     = {}
}
