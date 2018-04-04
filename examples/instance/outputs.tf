output "instance_id" {
  value = "${module.instance.id}"
}

output "public_ip" {
  value = "${module.instance.public_ip}"
}

output "private_ip" {
  value = "${module.instance.private_ip}"
}

output "instance_ami" {
  value = "${module.instance.ami}"
}

output "subnet_id" {
  value = "${module.instance.subnet_id}"
}

output "key_name" {
  value = "${module.instance.key_name}"
}
