
data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/vpn_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}


data "aws_ami" "ami_info" {
  most_recent = true

  owners = ["679593333241"] # give the openvpn AMI owner ID
  
  filter {
     name   = "name" # filter with name
     values = ["OpenVPN Access Server Community Image-fe8020db-*"] # Give the openvpn AMI Name
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}