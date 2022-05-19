module "web-dev" {
    source = "../../CHILD/VPC"
  vpc_cidr = "30.0.0.0/16"
    pub_cidr = "30.0.1.0/24"
    prv_cidr = "30.0.2.0/24"
    tag = "web"
}

module "web-server" {
  source = "git::https://github.com/ngiscards/Terraform-modules.git//CHILD/EC2"
  subnet_id = module.web-dev.private_subnet_id
  server_tag = "web-server"
}


module "prod-server" {
  source = "git::https://github.com/ngiscards/Terraform-modules.git//CHILD/EC2"
  subnet_id = module.web-dev.private_subnet_id
  server_tag = "prod-server"
  instance_type = "t2.large"
}
