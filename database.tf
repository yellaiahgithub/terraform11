#instance creation
resource "aws_instance" "database" {
  ami           =  "ami-01b8d743224353ffe"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet02.id
  vpc_security_group_ids = [aws_security_group.ssh1_group.id]
  availability_zone = "eu-west-2b"
  associate_public_ip_address = false
  key_name = "tcs-london"
  tags = {
    Name = "database"
}
}

