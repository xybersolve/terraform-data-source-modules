# General AMI lookup
# variable parameters
#  - ami_name
#  - ami_owner
#
data "aws_ami" "ami_find" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "${var.ami_name}",
    ]
  }

  filter {
    name = "owner-alias"
    values = [
      "${var.ami_owner}",
    ]
  }
}
