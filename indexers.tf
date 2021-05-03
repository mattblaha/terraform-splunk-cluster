resource "aws_instance" "indexer-manager" {
  count                  = 1
  ami                    = "ami-07d6726fc57ebfe52"
  instance_type          = "t3.micro"
  key_name               = "me"
  monitoring             = true
  #vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = module.dynamic_subnets.private_subnet_ids[count.index % length(module.dynamic_subnets.private_subnet_ids)]

  tags = {
    Name        = "indexer-manager"
    Terraform   = "true"
  }
}

resource "aws_instance" "indexer-peer" {
  count                  = 3
  ami                    = "ami-07d6726fc57ebfe52"
  instance_type          = "t3.micro"
  key_name               = "me"
  monitoring             = true
  #vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = module.dynamic_subnets.private_subnet_ids[count.index % length(module.dynamic_subnets.private_subnet_ids)]

  tags = {
    Name        = "indexer-peer-${count.index}"
    Terraform   = "true"
  }
}

