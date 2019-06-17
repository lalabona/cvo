resource "aws_security_group" "local_secgroup" {
    
    name            = "local_secgroup"
    #description     = "Allow SSH from Pi.In bound HTTPS and outbounds from anywhere."
    description     = "Allow all to access HTTP and HTTPS."
    vpc_id          = "${aws_vpc.vpc.id}"


    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.custom_ssh}"
        description = "Connect using my laptop."
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.allow_world}"
        description = "Connect using my laptop."
    }

    ingress {
        from_port   = 443 
        to_port     = 443
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.allow_world}"
        description = "Connect using my laptop."
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = "${var.allow_world}"
    }


    depends_on      = [ "aws_vpc.vpc" ] 
} 
