
resource "aws_iam_role" "occm_ec2_role" {
  name                = "occm_instance_profile_${replace(lower(var.admin)," ","_")}"
  description         = "Grants access to services required by NetApp's OnCommand Cloud Manager"
  assume_role_policy  = "${file("${path.module}/roles/occm-ec2-role.json")}"
}

#EC2 Instance Profile based on the provided role
resource "aws_iam_instance_profile" "occm_instance_profile" {
  name        = "occm_instance_profile_${replace(lower(var.admin)," ","_")}"
  role        = "${aws_iam_role.occm_ec2_role.id}"
  depends_on  = [
    "aws_iam_role.occm_ec2_role"
  ]
}

#Default policy document for privileges requireed by OnCommand Cloud Manager
resource "aws_iam_role_policy" "occm_role_policy" {
  name        = "occm_instance_profile_${replace(lower(var.admin)," ","_")}"
  role        = "${aws_iam_role.occm_ec2_role.id}"
  depends_on  = [
    "aws_iam_role.occm_ec2_role"
  ]

  policy = "${file("${path.module}/roles/policies/occm-role-policy.json")}"
}
