
resource "aws_instance" "occm" {
    monitoring                  = true
    ami                         = "${lookup(var.occm_amis, var.region)}"
    instance_type               = "m4.large"
    subnet_id                   = "${data.aws_subnet.r1.id}"
    vpc_security_group_ids      = ["${aws_security_group.outbound_rules.id}", "${aws_security_group.inbound_rules.id}", "${aws_security_group.local_secgroup.id}"]
    key_name                    = "${var.key_name}"
    associate_public_ip_address = "true"
    iam_instance_profile        = "${aws_iam_instance_profile.occm_instance_profile.id}"
    tags {
        Name = "OnCommand Cloud Manager",
        "Owned By" =  "${var.admin}",
        "Deployed Using" = "Terraform",
        "Provisioned Using" = "CHEF",
    }

/*
    #For now creating the OCCM manually.
    provisioner "local-exec" {
        command =<<EOF
            ansible-playbook '${var.ansible_provision_file}' --extra-vars 'occm_ip=${self.public_ip} \
                                                                    client_id=${var.client_id} \
                                                                    auth0_domain=${var.auth0_domain} \
                                                                    refToken=${var.refresh_token} \
                                                                    portalUserName=${var.portal_user_name}'
        EOF
    }    
*/

    depends_on = [
        "aws_iam_role_policy.occm_role_policy",
        "aws_iam_role.occm_ec2_role",
        "aws_security_group.inbound_rules",
        "aws_security_group.local_secgroup",
        "aws_key_pair.awscvo"
    ]
}
