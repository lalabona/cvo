
resource "aws_instance" "rclient" {

    ami                         = "ami-098bb5d92c8886ca1"
    instance_type               = "t2.micro"
    subnet_id                   = "${data.aws_subnet.r1.id}"
    vpc_security_group_ids      = ["${aws_security_group.local_secgroup.id}", "${aws_security_group.inbound_rules.id}", "${aws_security_group.outbound_rules.id}"]
    key_name                    = "${var.key_name}"
    associate_public_ip_address = "true"
    iam_instance_profile        = "${aws_iam_instance_profile.occm_instance_profile.id}"
    tags {
        Name = "Redhat x86 client",
        "Owned By" =  "${var.admin}",
        "Deployed Using" = "Terraform",
        "Provisioned Using" = "CHEF",
    }

    connection {
        host = "${aws_instance.rclient.public_ip}"
        type = "ssh"
        user = "ec2-user"
        private_key = "${file("${var.private_key_location}")}"
        timeout = "60m"
    }

    provisioner "file" {
        source = "./checkouts/bareminimumweb.py"
        destination = "/home/ec2-user/bareminimumweb.py"
    }

    provisioner "remote-exec" {
        inline = [
                  "sudo yum install -y nfs-utils", 
                  "sudo mkdir -p /opt/cvo",
                  "sudo mount 172.33.1.246:/test /opt/cvo",
                  "sudo date > /opt/cvo/writeevidence.log",
                  "sudo yum install -y python2", 
                  "cd /opt/cvo/; sudo python2 /home/ec2-user/bareminimumweb.py 80 &", 
             ]
    }

    depends_on = [
        "aws_security_group.inbound_rules",
        "aws_key_pair.awscvo"
    ]
}
