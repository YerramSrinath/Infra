variable "name" {
    default = "noom"  
}

variable "env" {
  default = "dev"
  }

  variable "vpcip" {
    default = "10.0.0.0/16"
  }

  variable "public_subnets_cidr" {
    default = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"
  }

variable "private_subnets_cidr" {
  default = "10.0.5.0/24,10.0.6.0/24,10.0.7.0/24"
}


  variable "azs" {
  }

  variable "map_public_ip_on_launch" {
  default = true
}
