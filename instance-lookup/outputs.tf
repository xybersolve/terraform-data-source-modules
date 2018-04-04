output "id" {
  value = "${data.aws_instance.this.id}"
}

output "ami" {
  value = "${data.aws_instance.this.ami}"
}

output "public_ip" {
  value = "${data.aws_instance.this.public_ip}"
}

output "private_ip" {
  value = "${data.aws_instance.this.private_ip}"
}

output "az" {
  value = "${data.aws_instance.this.availability_zone}"
}

output "subnet_id" {
  value = "${data.aws_instance.this.subnet_id}"
}

output "security_groups" {
  value = "${data.aws_instance.this.security_groups}"
}

output "vpc_security_groups" {
  value = "${data.aws_instance.this.vpc_security_group_ids}"
}

output "key_name" {
  value = "${data.aws_instance.this.key_name}"
}

output "tags" {
  value = "${data.aws_instance.this.tags}"
}

# output "password_data" {
#   value = "${data.aws_instance.this.password_data}"
# }
