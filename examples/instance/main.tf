#
#  Example of instance lookup
#
provider "aws" {
  profile = "${var.aws_profile}"
  region = "${var.aws_region}"
}

module "instance" {
  source = "../../instance-lookup"
  instance_name_tag = "${var.application}-${var.environment}-web"
}
