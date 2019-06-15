
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

output "write_unixclient_ip" {
   value                    = "${aws_instance.wclient.public_ip}"
   description              = "Unix client for testing."
}

/*
output "read_unixclient_ip" {
   value                    = "${aws_instance.rclient.public_ip}"
   description              = "Unix client for testing."
}

output "ids" {
  description = "List of IDs of instances"
  value       = "${aws_instance.occm.id}"
}

output "ip" {
  description = "List of IPs of instances"
  value       = "${aws_instance.occm.public_ip}"
}
*/
