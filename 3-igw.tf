resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.environment}-${local.eks_cluster_name}-igw"
  }
}