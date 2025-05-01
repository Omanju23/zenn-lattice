output "repository_url" {
  description = "ECRリポジトリのURL"
  value       = aws_ecr_repository.this.repository_url
}

output "repository_name" {
  description = "ECRリポジトリの名前"
  value       = aws_ecr_repository.this.name
}

output "repository_arn" {
  description = "ECRリポジトリのARN"
  value       = aws_ecr_repository.this.arn
}

output "docker_image_url" {
  description = "DockerイメージのURL (latest タグ)"
  value       = "${aws_ecr_repository.this.repository_url}:latest"
}
