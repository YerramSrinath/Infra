output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
  
}

output "public_subnets_id1" {
  #value = "${join(",", aws_subnet.public.*.id)}"
  value = "${element(aws_subnet.public.*.id, 1 )}"
}

output "public_subnets_id" {
  value = "${join(",", aws_subnet.public.*.id)}"
  #value = "${element(aws_subnet.public.*.id, 1 )}"
}

output "public_subnets_id2" {
  value = "${element(aws_subnet.public.*.id, 2 )}"
}



output "sg_id" {
  value = "${aws_security_group.allow_ssh_pub.id}"
}

output "private_subnets_id1" {
  #value = "${join(",", aws_subnet.public.*.id)}"
  value = "${element(aws_subnet.public.*.id, 1 )}"
}
output "private_subnets_id" {
  #value = "${join(",", aws_subnet.public.*.id)}"
  value = "${element(aws_subnet.public.*.id, 0 )}"
}
