




resource "aws_instance" "ec2" {
    ami = var.image
    # vpc_security_group_ids = [var.security_group_id1]
    instance_type = var.size
    associate_public_ip_address = true
    # key_name = "bhavanirayankula"
    # count = "${var.count1}" 
    subnet_id =  var.subnet_id
    # "${element(split(",", var.subnet_id), count.index%2)}"
  
 tags = {
      Name = var.name
    } 
}


output "ec2_id1" {
    value = aws_instance.ec2.id
  # value = "${element(aws_instance.ec2.*.id,1)}"
  #value = "${element(aws_instance.my-test-instance.*.id, 1)}"
}
# output "ec2_id2" {
#   value = "${element(aws_instance.name.*.id,1)}"
#   #value = "${element(aws_instance.my-test-instance.*.id, 2)}"
# }
