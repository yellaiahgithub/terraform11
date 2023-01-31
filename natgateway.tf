#nate gateway creation
resource "aws_eip" "nat" {}

resource "aws_nat_gateway" "nat01" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.subnet01.id
}

resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.main_digital.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat01.id
  }
}

resource "aws_route_table_association" "private_subnet" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.route_table_private.id
}






