# Construct local variables
locals {
  base_name = "${var.project}_${var.env}"
}

# Create primary VPC
resource "aws_vpc" "r_vpc" {
  cidr_block       = var.cidr_block

  tags = {
    Name = "${local.base_name}_vpc"
  }
}