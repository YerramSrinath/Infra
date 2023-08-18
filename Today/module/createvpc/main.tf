


resource "aws_vpc" "vpc" {
    cidr_block = var.vpcip
    tags = {
      Name = var.name
      envirnoment = var.env
    }
}


resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = var.name 
}
}


resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vpc.id
  count = "${length(split(",", var.public_subnets_cidr))}"
cidr_block   = "${element(split(",", var.public_subnets_cidr), count.index)}"
  availability_zone   = "${element(split(",", var.azs), count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

}


resource "aws_subnet" "private" {
  vpc_id = aws_vpc.vpc.id
  count = "${length(split(",", var.private_subnets_cidr))}"
cidr_block   = "${element(split(",", var.private_subnets_cidr), count.index)}"
  availability_zone   = "${element(split(",", var.azs), count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

}



resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id

     route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
}


resource "aws_route_table" "private" {
    vpc_id = aws_vpc.vpc.id

     route {
    cidr_block = "10.0.15.0/24"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  depends_on = [ aws_nat_gateway.nat ]
}

resource "aws_eip" "eip" {

}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id = "${element(aws_subnet.private.*.id, 0 )}"
  depends_on = [ aws_subnet.private ]
}




resource "aws_route_table_association" "public" {
  count          = "${length(split(",", var.public_subnets_cidr))}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = "${length(split(",", var.private_subnets_cidr))}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = aws_route_table.private.id
}




resource "aws_security_group" "allow_ssh_pub" {
  name        = "${var.name}-allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-allow_ssh_pub"
  }
}

