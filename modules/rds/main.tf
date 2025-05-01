# ランダムパスワードの生成
resource "random_password" "this" {
  length  = 16
  special = false
}

# SSMパラメータから既存のパスワードを取得
data "aws_ssm_parameter" "password" {
  name            = var.password_ssm_path
  with_decryption = true
  
  # パラメータが存在しない場合はエラーを無視
  count = 0
}

locals {
  # 既存のパスワードまたは新しいパスワードを使用
  db_password = try(data.aws_ssm_parameter.password[0].value, random_password.this.result)
}

# DBサブネットグループ
resource "aws_db_subnet_group" "this" {
  name        = "${var.identifier}-subnet-group"
  description = "Subnet group for ${var.identifier} RDS instance"
  subnet_ids  = var.subnet_ids
  
  tags = var.tags
}

# セキュリティグループ
resource "aws_security_group" "rds" {
  name        = "${var.identifier}-sg"
  description = "Security group for ${var.identifier} RDS instance"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow PostgreSQL traffic"
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  
  tags = merge(
    var.tags,
    {
      Name = "${var.identifier}-sg"
    }
  )
}

# DBパラメータグループ
resource "aws_db_parameter_group" "this" {
  name        = "${var.identifier}-pg"
  family      = var.parameter_group_family
  description = "Parameter group for ${var.identifier} RDS instance"
  
  # デフォルトのパラメータ設定
  parameter {
    name  = "max_connections"
    value = "100"
    apply_method = "pending-reboot"  # 静的パラメータには再起動が必要
  }
  
  tags = var.tags
}

# RDSインスタンス
resource "aws_db_instance" "this" {
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  username               = var.username
  password               = local.db_password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.this.name
  publicly_accessible    = false
  skip_final_snapshot    = true
  multi_az               = true
  
  # バックアップ設定
  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"
  
  # デフォルトのデータベース名
  db_name = "postgres"
  
  # パフォーマンスインサイトは最小構成では無効
  performance_insights_enabled = false
  
  tags = var.tags
}

# SSMパラメータストアにパスワードを保存
resource "aws_ssm_parameter" "password" {
  name        = var.password_ssm_path
  description = "Password for RDS instance ${var.identifier}"
  type        = "SecureString"
  value       = local.db_password
  
  tags = var.tags
}
