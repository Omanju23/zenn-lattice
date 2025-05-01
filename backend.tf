# S3バックエンドを使用する場合、以下のようにコメントを解除して設定してください
# terraform {
#   backend "s3" {
#     bucket         = "[バケット名]"
#     key            = "vpc-lattice-demo/terraform.tfstate"
#     region         = "ap-northeast-1"
#     encrypt        = true
#   }
# }
