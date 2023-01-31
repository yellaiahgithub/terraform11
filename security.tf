#create security group
  resource "aws_security_group" "ssh1_group" {
  name        = "ssh1"
  description = "ssh1 security group"
  vpc_id = aws_vpc.main_digital.id


ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "security_group_id" {
  value = aws_security_group.ssh1_group.id
}

