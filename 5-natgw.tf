resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${local.environment}-nat"
  }
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-zone1.id

  tags = {
    Name = "${local.environment}-${local.eks_cluster_name}-natgw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}