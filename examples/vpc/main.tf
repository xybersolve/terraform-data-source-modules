#
#  Example VPC lookup
#
provider "aws" {
  profile = "${var.aws_profile}"
  region = "${var.aws_region}"
}

module "vpc_data" {
  source  = "../../vpc_lookup"
  vpc_name_tag = "${var.application}-${var.environment}"
  private_subnet_name_tag = "${var.application}-${var.environment}-private-*"
  public_subnet_name_tag = "${var.application}-${var.environment}-public-*"
}

output "vpc_id" {
  value = "${module.vpc_data.vpc_id}"
}

output "private_subnet_ids" {
  value = ["${module.vpc_data.private_subnet_ids}"]
}

output "public_subnet_ids" {
  value = ["${module.vpc_data.public_subnet_ids}"]
}
