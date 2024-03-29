data "aws_security_groups" "inbound" {
   filter {
       name   = "group-name"
       values = ["cvo_tf_inbound"]
   }

    filter {
        name   = "vpc-id"
        values = ["${aws_vpc.vpc.id}"]
    }
    depends_on = ["aws_security_group.inbound_rules"]
}

data "aws_security_groups" "local" {
    filter {
        name   = "group-name"
        values = ["local_secgroup"]
    }
    depends_on = ["aws_security_group.local_secgroup"]
}


data "aws_subnet" "r1" {
    id = "${aws_subnet.r1.id}"

    depends_on = ["aws_subnet.r1"]
}

/*
data "aws_subnet" "r2" {

    id = "${aws_subnet.r2.id}"
    depends_on = ["aws_subnet.r2"]
}

data "aws_route_table" "rt" {
    subnet_id = "${aws_vpc.vpc.main_route_table_id}"
    depends_on = ["aws_subnet.r1"]
}
*/
