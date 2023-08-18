
variable "image" {
    default = "ami-0da59f1af71ea4ad2" 
}

variable "size" {
    default = "t2.micro"
}

variable "name" {
    default = "noom"
  
}
# variable "security_group_id1" {
# 	description = "Security Group you've created"
# }


variable "subnet_id" {
  description = "The VPC subnet the instance(s) will go in"
}

# variable "count1" {
#   description = "Number of instance(s) to be launched"
# }
