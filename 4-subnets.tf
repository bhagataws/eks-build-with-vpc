resource "aws_subnet" "public-zone1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_zone1_cidr-public-1
  availability_zone = local.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.environment}-${local.eks_cluster_name}-zone1-public1"
  }
}
resource "aws_subnet" "public-zone2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_zone1_cidr-public-2
  availability_zone = local.zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.environment}-${local.eks_cluster_name}-zone1-public2"
  }
}

resource "aws_subnet" "private-zone1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_zone2_cidr-private-1
  availability_zone = local.zone1
  tags = {
    Name = "${local.environment}-${local.eks_cluster_name}-zone2-private-1"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${local.environment}-${local.eks_cluster_name}" = "owned"
  }
}
resource "aws_subnet" "private-zone2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_zone2_cidr-private-2
  availability_zone = local.zone2
  tags = {
    Name = "${local.environment}-${local.eks_cluster_name}-zone2-private-2"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${local.environment}-${local.eks_cluster_name}" = "owned"
  }
}
