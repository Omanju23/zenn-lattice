# # クライアントVPC
# module "client_vpc" {
#   source = "./modules/vpc"
  
#   vpc_name            = local.client_vpc_name
#   vpc_cidr            = var.client_vpc_cidr
#   availability_zones  = var.availability_zones
#   public_subnet_suffix  = local.public_subnet_suffix
#   private_subnet_suffix = local.private_subnet_suffix
  
#   tags = local.common_tags
# }

# # オンプレミスVPC
# module "onprem_vpc" {
#   source = "./modules/vpc"
  
#   vpc_name            = local.onprem_vpc_name
#   vpc_cidr            = var.onprem_vpc_cidr
#   availability_zones  = var.availability_zones
#   public_subnet_suffix  = local.public_subnet_suffix
#   private_subnet_suffix = local.private_subnet_suffix
  
#   tags = local.common_tags
# }

# # プロバイダーVPC（Lattice）
# module "provider_vpc_lattice" {
#   source = "./modules/vpc"
  
#   vpc_name            = local.provider_vpc_lattice_name
#   vpc_cidr            = var.provider_vpc_lattice_cidr
#   availability_zones  = var.availability_zones
#   public_subnet_suffix  = local.public_subnet_suffix
#   private_subnet_suffix = local.private_subnet_suffix
  
#   tags = local.common_tags
# }

# # プロバイダーVPC（Resource）
# module "provider_vpc_resource" {
#   source = "./modules/vpc"
  
#   vpc_name            = local.provider_vpc_resource_name
#   vpc_cidr            = var.provider_vpc_resource_cidr
#   availability_zones  = var.availability_zones
#   public_subnet_suffix  = local.public_subnet_suffix
#   private_subnet_suffix = local.private_subnet_suffix
  
#   tags = local.common_tags
# }

# # VPCピアリング（クライアントVPC <-> オンプレミスVPC）
# module "vpc_peering" {
#   source = "./modules/vpc_peering"
  
#   peering_name = local.vpc_peering_name
#   requester_vpc_id = module.client_vpc.vpc_id
#   accepter_vpc_id = module.onprem_vpc.vpc_id
#   requester_cidr_block = var.client_vpc_cidr
#   accepter_cidr_block = var.onprem_vpc_cidr
  
#   # プライベートルートテーブルにピアリングルートを追加
#   requester_route_table_ids = module.client_vpc.private_route_table_ids
#   accepter_route_table_ids = module.onprem_vpc.private_route_table_ids
  
#   tags = local.common_tags
# }

# # VPCフローログ設定
# module "client_vpc_flow_logs" {
#   source = "./modules/vpc_flow_logs"
  
#   vpc_id = module.client_vpc.vpc_id
#   vpc_name = local.client_vpc_name
#   retention_in_days = var.flow_log_retention_days
  
#   tags = local.common_tags
# }

# module "onprem_vpc_flow_logs" {
#   source = "./modules/vpc_flow_logs"
  
#   vpc_id = module.onprem_vpc.vpc_id
#   vpc_name = local.onprem_vpc_name
#   retention_in_days = var.flow_log_retention_days
  
#   tags = local.common_tags
# }

# module "provider_vpc_lattice_flow_logs" {
#   source = "./modules/vpc_flow_logs"
  
#   vpc_id = module.provider_vpc_lattice.vpc_id
#   vpc_name = local.provider_vpc_lattice_name
#   retention_in_days = var.flow_log_retention_days
  
#   tags = local.common_tags
# }

# module "provider_vpc_resource_flow_logs" {
#   source = "./modules/vpc_flow_logs"
  
#   vpc_id = module.provider_vpc_resource.vpc_id
#   vpc_name = local.provider_vpc_resource_name
#   retention_in_days = var.flow_log_retention_days
  
#   tags = local.common_tags
# }

# ECRリポジトリ
module "ecr" {
  source = "./modules/ecr"
  
  repository_name = "${var.project_name}-repository"
  
  tags = local.common_tags
}

# # VPCエンドポイント (Provider-VPC-Latticeのみ)
# module "provider_vpc_lattice_endpoints" {
#   source = "./modules/vpc_endpoints"
  
#   vpc_id         = module.provider_vpc_lattice.vpc_id
#   vpc_name       = local.provider_vpc_lattice_name
#   subnet_ids     = module.provider_vpc_lattice.private_subnet_ids
#   route_table_ids = module.provider_vpc_lattice.private_route_table_ids
#   vpc_cidr       = var.provider_vpc_lattice_cidr
  
#   tags = local.common_tags
# }

# # ECSサービス
# module "ecs" {
#   source = "./modules/ecs"
  
#   cluster_name = local.ecs_cluster_name
#   service_name = local.ecs_service_name
#   vpc_id = module.provider_vpc_lattice.vpc_id
#   subnet_ids = module.provider_vpc_lattice.private_subnet_ids
#   container_port = var.ecs_container_port
#   desired_count = var.ecs_desired_count
#   container_image = module.ecr.docker_image_url
  
#   tags = local.common_tags
# }

# # Lambda関数
# module "lambda" {
#   source = "./modules/lambda"
  
#   function_name = local.lambda_function_name
#   vpc_id = module.provider_vpc_lattice.vpc_id
#   subnet_ids = module.provider_vpc_lattice.private_subnet_ids
#   runtime = var.lambda_runtime
#   memory_size = var.lambda_memory_size
#   timeout = var.lambda_timeout
  
#   tags = local.common_tags
# }

# # RDSインスタンス
# module "rds" {
#   source = "./modules/rds"
  
#   identifier = local.rds_identifier
#   vpc_id = module.provider_vpc_resource.vpc_id
#   subnet_ids = module.provider_vpc_resource.private_subnet_ids
#   instance_class = var.rds_instance_class
#   engine_version = var.rds_engine_version
#   username = var.rds_username
#   password_ssm_path = local.rds_password_path
  
#   tags = local.common_tags
# }
