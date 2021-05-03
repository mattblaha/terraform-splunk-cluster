resource "aws_instance" "search_heads" {
  count                  = 3
  ami                    = "ami-07d6726fc57ebfe52"
  instance_type          = "t3.micro"
  key_name               = "me"
  monitoring             = true
  #vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = module.dynamic_subnets.public_subnet_ids[count.index % length(module.dynamic_subnets.public_subnet_ids)]

  tags = {
    Name        = "search-head-${count.index}"
    Terraform   = "true"
  }
}
