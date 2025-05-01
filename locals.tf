locals {
  vpc_name_prefix = var.project_name
  
  # VPC名
  client_vpc_name    = "${local.vpc_name_prefix}-client"
  onprem_vpc_name    = "${local.vpc_name_prefix}-onprem"
  provider_vpc_lattice_name = "${local.vpc_name_prefix}-provider-lattice"
  provider_vpc_resource_name = "${local.vpc_name_prefix}-provider-resource"
  
  # サブネット設定
  public_subnet_suffix   = "public"
  private_subnet_suffix  = "private"
  
  # VPCピアリング名
  vpc_peering_name = "${local.vpc_name_prefix}-client-to-onprem"
  
  # ECS設定
  ecs_cluster_name  = "${local.vpc_name_prefix}-cluster"
  ecs_service_name  = "${local.vpc_name_prefix}-service"
  
  # Lambda設定
  lambda_function_name = "${local.vpc_name_prefix}-function"
  
  # RDS設定
  rds_identifier = "${local.vpc_name_prefix}-postgres"
  
  # SSMパラメータパス
  rds_password_path = "/vpc-lattice/rds/password"
  
  # 共通タグ
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
