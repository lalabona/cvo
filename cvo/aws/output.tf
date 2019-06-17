
output "id"  {
   value                    = "${aws_vpc.vpc.id}"
   description              = "VPD ID"
}

output "arn"  {
   value                    = "${aws_vpc.vpc.arn}"
   description              = "VPD ARN"
}

output "r1_subnet" {
   value                    = "${aws_subnet.r1.id}"
   description              = "Subnet for R1 instnaces."
}

output "occm_public_ip" {
   value                    = "${aws_instance.occm.public_ip}"
   description              = "Oncommand cloud manager public IP testing."
}

output "unixclient_ip" {
   value                    = "${aws_instance.client.public_ip}"
   description              = "Unix client for testing."
}

output "ids" {
  description = "List of IDs of instances"
  value       = "${aws_instance.occm.id}"
}

