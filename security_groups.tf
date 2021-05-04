resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH from configured CIDR"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "SSH from Internet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.external_cidr]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.external_cidr]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "splunk_nodes" {
  name        = "splunk_nodes"
  description = "Communication between Splunk nodes"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "SSH between Splunk nodes"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    self             = true
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
