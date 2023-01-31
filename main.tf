# vpc creation
resource "aws_vpc" "main_digital" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "digitallink"
  }
}
#subnet creation 1

resource "aws_subnet" "subnet01" {
  vpc_id     = aws_vpc.main_digital.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name = "sub01"
  }
}
#subnet creation 2
resource "aws_subnet" "subnet02" {
  vpc_id     = aws_vpc.main_digital.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"
  tags = {
   Name = "sub02"
   }
}
#subnet creation 3

resource "aws_subnet" "subnet03" {
  vpc_id     = aws_vpc.main_digital.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-2c"
  tags = {
    Name = "sub03"
  }
}

#Internetgateway
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.main_digital.id
  tags = {
   Name = "igway"
    }
}
#create route table

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.main_digital.id
   tags = {
    Name = "public_rt"
     }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.main_digital.id
   tags = {
    Name = "private_rt"
   }
}
#create route table01

resource "aws_route_table" "route_table_public01" {
  vpc_id = aws_vpc.main_digital.id
   tags = {
    Name = "public01_rt"
     }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }
}

#route table Association01

resource "aws_route_table_association" "route_table_public" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.route_table_public.id
}
#route table association02
resource "aws_route_table_association" "route_table_private" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.route_table_private.id
}
#route table Association03

resource "aws_route_table_association" "route_table_public01" {
  subnet_id      = aws_subnet.subnet03.id
  route_table_id = aws_route_table.route_table_public01.id
}
    



