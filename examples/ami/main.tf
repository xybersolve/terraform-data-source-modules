#
# Example AMI lookup (generic lookup)
#
#
provider "aws" {
  profile = "${var.aws_profile}"
  region = "${var.aws_region}"
}

module "ami_find" {
  source = "../../ami-lookup"
  ami_name = "amzn-ami-hvm-*-x86_64-gp2"
  ami_owner = "amazon"
}

output "ami_id" {
  value = "${module.ami_find.ami_id}"
}
