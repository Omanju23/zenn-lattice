# ECRリポジトリ
resource "aws_ecr_repository" "this" {
  name                 = var.repository_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = var.tags
}

# ECRリポジトリポリシー
resource "aws_ecr_repository_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowPullPush"
        Effect = "Allow"
        Principal = {
          "AWS" = "*"  # 同一アカウント内の全てのIAMエンティティにアクセスを許可
        }
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ]
      }
    ]
  })
}

# ECRライフサイクルポリシー - 古いイメージを自動削除
resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 10 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}

# ECRログインのためのシェルスクリプト生成
resource local_file push_script {
  content = <<-EOF
#!/bin/bash
# ECRにDockerイメージをプッシュするためのヘルパースクリプト
# 注意: このスクリプトを実行する前に、AWS CLIが設定されていることを確認してください

# 変数
REGION="ap-northeast-1"
REPOSITORY_URI="${aws_ecr_repository.this.repository_url}"
IMAGE_TAG="latest"
PROFILE_ARG=""

# 引数の解析
while [[ $# -gt 0 ]]; do
  case $1 in
    --profile)
      PROFILE_ARG="--profile $2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

# ECRにログイン
echo "ECRにログインしています..."
aws ecr get-login-password --region $REGION $PROFILE_ARG | docker login --username AWS --password-stdin $REPOSITORY_URI

# Dockerイメージのビルド
echo "Dockerイメージをビルドしています..."
docker build -t $REPOSITORY_URI:$IMAGE_TAG .

# ECRへのプッシュ
echo "イメージをECRにプッシュしています..."
docker push $REPOSITORY_URI:$IMAGE_TAG

echo "完了しました！"
echo "イメージは $REPOSITORY_URI:$IMAGE_TAG で利用可能です"
  EOF
  filename = "${path.module}/push_image.sh"

  # 実行権限を付与
  provisioner "local-exec" {
    command = "chmod +x ${path.module}/push_image.sh"
  }
}