output "vpc_id" {
  value = "${data.aws_vpc.this.id}"
}

output "private_subnet_ids" {
  value = "${data.aws_subnet_ids.private.ids}"
}

output "public_subnet_ids" {
  value = "${data.aws_subnet_ids.public.ids}"
}
