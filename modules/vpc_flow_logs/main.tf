# CloudWatch Logsグループ
resource "aws_cloudwatch_log_group" "flow_logs" {
  name              = "/aws/vpc-flow-logs/${var.vpc_name}"
  retention_in_days = var.retention_in_days
  
  tags = var.tags
}

# フローログ用のIAMロール
resource "aws_iam_role" "flow_logs" {
  name = "vpc-flow-logs-role-${var.vpc_name}"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })
  
  tags = var.tags
}

# フローログ用のIAMポリシー
resource "aws_iam_policy" "flow_logs" {
  name        = "vpc-flow-logs-policy-${var.vpc_name}"
  description = "Allow VPC Flow Logs to write to CloudWatch Logs"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Effect   = "Allow"
        Resource = "${aws_cloudwatch_log_group.flow_logs.arn}:*"
      }
    ]
  })
  
  tags = var.tags
}

# IAMロールにポリシーをアタッチ
resource "aws_iam_role_policy_attachment" "flow_logs" {
  role       = aws_iam_role.flow_logs.name
  policy_arn = aws_iam_policy.flow_logs.arn
}

# VPCフローログ
resource "aws_flow_log" "this" {
  log_destination      = aws_cloudwatch_log_group.flow_logs.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id
  iam_role_arn         = aws_iam_role.flow_logs.arn
  
  tags = merge(
    var.tags,
    {
      Name = "flow-logs-${var.vpc_name}"
    }
  )
}
