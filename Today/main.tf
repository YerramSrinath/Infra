


module "network" {
  source = "./module/createvpc"
  name   = "noom"
  env    = "devv"

  public_subnets_cidr  = "10.0.10.0/24,10.0.11.0/24,10.0.12.0/24"
  private_subnets_cidr = "10.0.15.0/24,10.0.16.0/24,10.0.17.0/24"
  azs                  = "ap-south-1a,ap-south-1b,ap-south-1c"
}


module "vm" {
  source = "./module/createvm"
  name   = "scrapper"
  # count1             = "2"
  # security_group_id1 = module.network.sg_id
  subnet_id = module.network.public_subnets_id1
}



