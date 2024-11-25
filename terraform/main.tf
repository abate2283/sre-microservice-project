locals {
  ami_type               = "AL2-x86_64"
  azs                    = slice(data.aws_availability_zones.available.names, 0, 3)
  capacity_type          = "SPOT"
  cluster_name           = "sre-microservice-project"
  cluster_version        = "1.29"
  disk_size              = 30
  enable_cluster_creator = true
  enable_nat_gateway     = true
  enable_public_access   = true
  instacne_types         = ["t3.medium"]
  node_desired_size      = 3
  node_max_size          = 5
  node_min_size          = 1
  intra_subnets          = ["10.0.10.0/24", "10.0.11/24", "10.0.12.0/24"]
  private_subnets        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets         = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  single_nat_gateway     = true
  vpc_cidr               = "10.0.0.0/16"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "5.16.0"
  name               = "${local.cluster_name}-vpc" # sre-microservice-project-vpc
  azs                = local.azs
  cidr               = local.vpc_cidr
  intra_subnets      = local.intra_subnets
  private_subnets    = local.private_subnets
  enable_nat_gateway = local.enable_nat_gateway
  single_nat_gateway = local.single_nat_gateway
}