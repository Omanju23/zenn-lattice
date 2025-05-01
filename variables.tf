variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
  default     = "vpc-lattice-demo"
}

variable "environment" {
  description = "環境名"
  type        = string
  default     = "dev"
}

# VPC設定
variable "client_vpc_cidr" {
  description = "クライアントVPCのCIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "onprem_vpc_cidr" {
  description = "オンプレミスVPCのCIDR"
  type        = string
  default     = "10.2.0.0/16"
}

variable "provider_vpc_lattice_cidr" {
  description = "プロバイダーVPC (Lattice)のCIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "provider_vpc_resource_cidr" {
  description = "プロバイダーVPC (Resource)のCIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "使用するアベイラビリティゾーン"
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
}

# ECS設定
variable "ecs_container_port" {
  description = "ECSコンテナのポート"
  type        = number
  default     = 80
}

variable "ecs_desired_count" {
  description = "ECSタスクの希望実行数"
  type        = number
  default     = 1
}

# Lambda設定
variable "lambda_runtime" {
  description = "Lambda関数のランタイム"
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_memory_size" {
  description = "Lambda関数のメモリサイズ(MB)"
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "Lambda関数のタイムアウト(秒)"
  type        = number
  default     = 10
}

# RDS設定
variable "rds_instance_class" {
  description = "RDSインスタンスクラス"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_engine_version" {
  description = "PostgreSQLのバージョン"
  type        = string
  default     = "13"
}

variable "rds_username" {
  description = "RDSのマスターユーザー名"
  type        = string
  default     = "postgres"
}

# VPCフローログ設定
variable "flow_log_retention_days" {
  description = "VPCフローログの保持日数"
  type        = number
  default     = 7
}

# SSMパラメータストア設定
variable "ssm_parameter_prefix" {
  description = "SSMパラメータのプレフィックス"
  type        = string
  default     = "/vpc-lattice-demo/dev"
}
