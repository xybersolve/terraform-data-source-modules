#
#  Lookup extant instance, using tag 'Name'
#
data "aws_instance" "this" {
  # tags {
  #   Name = "${var.instance_name_tag}"
  # }
  filter {
    name   = "tag:Name"
    values = ["${var.instance_name_tag}"]
  }
}
