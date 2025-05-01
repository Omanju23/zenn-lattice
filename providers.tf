provider "aws" {
  region  = var.aws_region
  profile = "vpc-lattice-demo"  

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
