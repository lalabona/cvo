resource "aws_security_group" "outbound_rules" {
    
    name            = "cvo_tf_outbound"
    description     = "Defining outbound traffic firewall rules for cloud volume ONTAP."
    vpc_id          = "${aws_vpc.vpc.id}"

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    depends_on      = [ "aws_vpc.vpc" ]
}
