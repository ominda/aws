# Construct local variables
locals {
  private_subnets = var.private_subnets
}

resource "aws_instance" "r_private_ec2_instances" {
    count = var.ec2_instance_count
  ami           = data.aws_ami.d_ubuntu_amis.id
  instance_type = "t3.micro"
  associate_public_ip_address = false
  key_name = var.ssh_key  
  subnet_id = local.private_subnets[0].id
#   user_data_base64 = 
#   user_data_replace_on_change = true
#   vpc_security_group_ids = 

  tags = {
    Name = format("${local.base_name}-ec2-0%d", count.index + 1)
  }
}