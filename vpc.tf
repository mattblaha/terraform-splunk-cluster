module "vpc" {
  source = "cloudposse/vpc/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version    = "0.23.0"
  namespace  = "eg"
  stage      = "test"
  name       = "app"
  cidr_block = "10.0.0.0/16"
}

module "dynamic_subnets" {
  source = "cloudposse/dynamic-subnets/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version            = "0.39.0"
  namespace          = "eg"
  stage              = "test"
  name               = "app"
  availability_zones = ["us-east-1a","us-east-1b","us-east-1c"]
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.vpc.igw_id
  cidr_block         = "10.0.0.0/16"
  nat_gateway_enabled = true
}
