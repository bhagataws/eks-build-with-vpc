resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
   tags = {
    Name = "${local.environment}-private-route"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.gw.id
  }
   tags = {
    Name = "${local.environment}-public-route"
  }
}

resource "aws_route_table_association" "public-zone1" {
  subnet_id      = aws_subnet.public-zone1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-zone2" {
  subnet_id      = aws_subnet.public-zone2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-zone1" {
  subnet_id      = aws_subnet.private-zone1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-zone2" {
  subnet_id      = aws_subnet.private-zone2.id
  route_table_id = aws_route_table.private.id
}