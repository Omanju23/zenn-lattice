# # VPC情報
# output "client_vpc_id" {
#   description = "クライアントVPCのID"
#   value       = module.client_vpc.vpc_id
# }

# output "onprem_vpc_id" {
#   description = "オンプレミスVPCのID"
#   value       = module.onprem_vpc.vpc_id
# }

# output "provider_vpc_lattice_id" {
#   description = "プロバイダーVPC（Lattice）のID"
#   value       = module.provider_vpc_lattice.vpc_id
# }

# output "provider_vpc_resource_id" {
#   description = "プロバイダーVPC（Resource）のID"
#   value       = module.provider_vpc_resource.vpc_id
# }

# # VPCピアリング情報
# output "vpc_peering_id" {
#   description = "VPCピアリング接続のID"
#   value       = module.vpc_peering.vpc_peering_id
# }

# output "vpc_peering_status" {
#   description = "VPCピアリング接続のステータス"
#   value       = module.vpc_peering.vpc_peering_status
# }

# # ECS情報
# output "ecs_cluster_id" {
#   description = "ECSクラスターのID"
#   value       = module.ecs.cluster_id
# }

# output "ecs_service_name" {
#   description = "ECSサービスの名前"
#   value       = module.ecs.service_name
# }

# # Lambda情報
# output "lambda_function_name" {
#   description = "Lambda関数の名前"
#   value       = module.lambda.function_name
# }

# output "lambda_function_url" {
#   description = "Lambda関数のURL"
#   value       = module.lambda.function_url
# }

# # RDS情報
# output "rds_instance_endpoint" {
#   description = "RDSインスタンスのエンドポイント"
#   value       = module.rds.instance_endpoint
# }

# output "rds_username" {
#   description = "RDSインスタンスのマスターユーザー名"
#   value       = module.rds.username
# }

# output "rds_password_ssm_path" {
#   description = "RDSパスワードのSSMパラメータパス"
#   value       = module.rds.password_ssm_path
# }

# # ECR情報
# output "ecr_repository_url" {
#   description = "ECRリポジトリのURL"
#   value       = module.ecr.repository_url
# }

# # VPCエンドポイント情報 (Provider-VPC-Latticeのみ)
# output "vpc_endpoint_s3_id" {
#   description = "S3 VPCエンドポイントのID"
#   value       = module.provider_vpc_lattice_endpoints.vpc_endpoint_s3_id
# }

# output "vpc_endpoint_ecr_api_id" {
#   description = "ECR API VPCエンドポイントのID"
#   value       = module.provider_vpc_lattice_endpoints.vpc_endpoint_ecr_api_id
# }

# output "vpc_endpoint_ecr_dkr_id" {
#   description = "ECR Docker VPCエンドポイントのID"
#   value       = module.provider_vpc_lattice_endpoints.vpc_endpoint_ecr_dkr_id
# }

# output "vpc_endpoint_logs_id" {
#   description = "CloudWatch Logs VPCエンドポイントのID"
#   value       = module.provider_vpc_lattice_endpoints.vpc_endpoint_logs_id
# }

# # 接続情報
# output "connection_commands" {
#   description = "各リソースへの接続コマンド例（VPC Lattice/PrivateLink設定後）"
#   value = {
#     ecs_curl = "# CloudShellから: curl -v http://<VPC-Lattice-Service-Name>.<VPC-Lattice-Domain>"
#     lambda_curl = "# CloudShellから: curl -v http://<VPC-Lattice-Service-Name>.<VPC-Lattice-Domain>/lambda"
#     postgres_connection = "# CloudShellから: psql -h <RDS-PrivateLink-Endpoint> -U ${module.rds.username} -d ${module.rds.db_name}"
#   }
# }
