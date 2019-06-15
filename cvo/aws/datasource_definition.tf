data "aws_security_groups" "inbound" {
  filter {
    name   = "group-name"
    values = ["cvo_tf_inbound"]
  }

  filter {
    name   = "vpc-id"
    values = ["${aws_vpc.vpc.id}"]
  }
}

data "aws_security_groups" "local" {
  filter {
    name   = "group-name"
    values = ["local_secgroup"]
  }
}


data "aws_subnet" "r1" {
    id = "${aws_subnet.r1.id}"

    filter { name   = "tag:Name"
             values = ["Subnet for R1 site hosting."]
    }
    depends_on = ["aws_subnet.r1"]
}

/*
data "aws_subnet" "r2" {

    vpc_id = "${data.aws_vpc.selected.id}"
    filter { name   = "tag:Name"
             values = ["r2_subnet"]
    }      
    depends_on = ["aws_subnet.r2"]
}

data "aws_route_table" "rt" {
    subnet_id = "${aws_vpc.vpc.main_route_table_id}"
    depends_on = ["aws_subnet.r1"]
}
*/
