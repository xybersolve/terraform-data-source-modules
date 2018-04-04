#
# Data source module, lookup VPC, public & private subnet ids
#  - given 'Name' tags of each
#
#  - inputs:
#       - vpc_name_tag
#       - public_subnet_name_tag
#       - private_subnet_name_tag
#   - outputs:
#       - vpc_id: string
#       - private_subnet_ids: list
#       - public_subnet_ids: list
#
#
# Example:
#   module "vpc_data" {
#      source  = "../../../modules/data_sources/vpc"
#      vpc_name_tag = "${var.application}-${var.environment}"
#      private_subnet_name_tag = "${var.application}-${var.environment}-private-*"
#      public_subnet_name_tag = "${var.application}-${var.environment}-public-*"
#   }
#
#  locals
#     vpc_id = "${module.vpc_data.vpc_id}"
#     private_subnet_id = "${module.vpc_data.private_subnet_ids[0]}"
#     public_subnet_id = "${module.vpc_data.public_subnet_ids[0]}"
#  }
#
data "aws_vpc" "this" {
  tags {
    Name = "${var.vpc_name_tag}"
  }
}
# public subnet id
data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.this.id}"
  tags {
    Name = "${var.public_subnet_name_tag}"
  }
}
# private subnet id
data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.this.id}"
  tags {
    Name = "${var.private_subnet_name_tag}"
  }
}

output "vpc_id" {
  value = "${data.aws_vpc.this.id}"
}

output "private_subnet_ids" {
  value = "${data.aws_subnet_ids.private.ids}"
}

output "public_subnet_ids" {
  value = "${data.aws_subnet_ids.public.ids}"
}
