# Construct local variables
locals {
  private_subnets = var.private_subnets
  base_name = "${var.project}_${var.env}"
  public_subnets = var.public_subnets
}
