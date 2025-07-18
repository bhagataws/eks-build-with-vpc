resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames  = true
  enable_dns_support = true
  tags = {
    Name = "${local.environment}-${local.eks_cluster_name}"
  }
}