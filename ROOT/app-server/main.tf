module "vpc" {
    source = "../../CHILD/VPC"
  
}

module "app-dev" {
    source = "../../CHILD/VPC"
  vpc_cidr = "20.0.0.0/16"
    pub_cidr = "20.0.1.0/24"
    prv_cidr = "20.0.2.0/24"
    tag = "app"
}

module "app-server" {
  source = ""
  
}