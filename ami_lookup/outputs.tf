output "ami_id" {
  value = "${data.aws_ami.ami_find.id}"
}
