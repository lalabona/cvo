provider aws {
    region                  = "${var.region}"
    shared_credentials_file = "/home/pi/.aws/credentials"
    profile                 = "skylab"
}

resource "aws_vpc" "vpc" {
    cidr_block              = "${var.cidr}"
}


resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vpc.id}"

    depends_on = ["aws_vpc.vpc"]
}

resource "aws_route" "route" {
    route_table_id           = "${aws_vpc.vpc.main_route_table_id}"
    destination_cidr_block   = "0.0.0.0/0"
    gateway_id               = "${aws_internet_gateway.igw.id}"

    depends_on               = ["aws_internet_gateway.igw"]
}

resource "aws_subnet" "r1" {
    vpc_id     = "${aws_vpc.vpc.id}"
    cidr_block = "${var.r1_subnet_cidr}"

    tags       = { Name = "Subnet for R1 site hosting." }
    depends_on = ["aws_vpc.vpc"]
}

resource "aws_route_table_association" "route_associate" {
    subnet_id      = "${aws_subnet.r1.id}"
    route_table_id = "${aws_vpc.vpc.main_route_table_id}"
    depends_on     = ["aws_subnet.r1"]
}
