resource "aws_security_group" "inbound_rules" {
    
    name            = "cvo_tf_inbound"
    description     = "Defining inbound traffic firewall rules for cloud volume ONTAP."
    vpc_id          = "${aws_vpc.vpc.id}"


    ingress {
        from_port   = 0
        to_port     = 8
        protocol    = "icmp"
        cidr_blocks = "${var.cidr_blocks}"
        description = "All ping anywhere with in the VPC."
    }
    

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "HTTP access to the System Manager web console using the IP address of the cluster management LIF."
    }


    
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "HTTPS 443 HTTPS access to the System Manager web console using the IP address of the cluster management LIF."
    }


    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "SSH access to the IP address of the cluster management LIF or a node management LIF."
    }


    ingress {
        from_port   = 111
        to_port     = 111
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Remote procedure call for NFS."
    }


    ingress {
        from_port   = 139
        to_port     = 139
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "NetBIOS service session for CIFS."
    }


    ingress {
        from_port   = 161
        to_port     = 161
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "SNMP."
    }

    ingress {
        from_port   = 162
        to_port     = 162
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "SNMP."
    }

    ingress {
        from_port   = 445
        to_port     = 445
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Microsoft SMB/CIFS over TCP with NetBIOS framing."
    }


    ingress {
        from_port   = 635
        to_port     = 635
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Allow NFS mount."
    }


    ingress {
        from_port   = 749
        to_port     = 749
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Allow Kerberos based access."
    }


    ingress {
        from_port   = 2049
        to_port     = 2049
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "NFS server daemon."
    }


    ingress {
        from_port   = 3260
        to_port     = 3260
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "iSCSI access through the iSCSI data LIF."
    }


    ingress {
        from_port   = 4045
        to_port     = 4045
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "NFS lock daemon."
    }


    ingress {
        from_port   = 4046
        to_port     = 4046
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Network status monitor for NFS."
    }


    ingress {
        from_port   = 10000
        to_port     = 10000
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Backup using NDMP."
    }


    ingress {
        from_port   = 11104
        to_port     = 11104
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Management of intercluster communication sessions for SnapMirror."
    }


    ingress {
        from_port   = 11105
        to_port     = 11105
        protocol    = "${var.tcp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "SnapMirror data transfer using intercluster LIFs."
    }


    ingress {
        from_port   = 111
        to_port     = 111
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Remote procedure call for NFS."
    }


    ingress {
        from_port   = 161
        to_port     = 161
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "SNMP."
    }

    ingress {
        from_port   = 162
        to_port     = 162
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "SNMP."
    }


    ingress {
        from_port   = 635
        to_port     = 635
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "NFS mount."
    }


    ingress {
        from_port   = 2049
        to_port     = 2049
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "NFS server daemon."
    }


    ingress {
        from_port   = 4045
        to_port     = 4045
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "NFS lock daemon."
    }


    ingress {
        from_port   = 4046
        to_port     = 4046
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "Network status monitor for NFS."
    }


    ingress {
        from_port   = 4049
        to_port     = 4049
        protocol    = "${var.udp}"
        cidr_blocks = "${var.cidr_blocks}"
        description = "NFS rquotad protocol."
    }


    depends_on      = [ "aws_vpc.vpc" ] 

}
