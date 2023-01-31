#instance creation
resource "aws_instance" "lmsfront" {
  ami           =  "ami-0d09654d0a20d3ae2"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.subnet01.id
  vpc_security_group_ids = [aws_security_group.ssh1_group.id]
  availability_zone = "eu-west-2a"
  associate_public_ip_address = true
  key_name = "tcs-london"
  tags = {
    Name = "frontend-webapp"
}
}

  
