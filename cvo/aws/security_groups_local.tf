resource "aws_security_group" "local_secgroup" {
    
    name            = "local_secgroup"
    description     = "Defining inbound traffic firewall rules for cloud volume ONTAP."
    vpc_id          = "${aws_vpc.vpc.id}"


    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "${var.tcp}"
        cidr_blocks = ["165.225.104.55/32"]
        description = "Connect using my laptop."
    }

    ingress {
        from_port   = 443 
        to_port     = 443
        protocol    = "${var.tcp}"
        cidr_blocks = ["165.225.104.55/32"]
        description = "Connect using my laptop."
    }


    depends_on      = [ "aws_vpc.vpc" ] 
} 
