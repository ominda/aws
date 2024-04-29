module "vpc" {
  source          = "./vpc"
  cidr_block      = var.v_primary_cidr_block
  project         = var.v_project
  env             = var.v_environment
  public_subnets  = var.v_public_subnets
  private_subnets = var.v_private_subnets
}