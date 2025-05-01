output "cluster_id" {
  description = "ECSクラスターのID"
  value       = aws_ecs_cluster.this.id
}

output "cluster_arn" {
  description = "ECSクラスターのARN"
  value       = aws_ecs_cluster.this.arn
}

output "service_id" {
  description = "ECSサービスのID"
  value       = aws_ecs_service.this.id
}

output "service_name" {
  description = "ECSサービスの名前"
  value       = aws_ecs_service.this.name
}

output "task_definition_arn" {
  description = "タスク定義のARN"
  value       = aws_ecs_task_definition.this.arn
}

output "security_group_id" {
  description = "ECSサービスのセキュリティグループID"
  value       = aws_security_group.ecs.id
}
