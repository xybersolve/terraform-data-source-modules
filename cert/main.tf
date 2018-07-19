data "aws_acm_certificate" "this" {
  domain   = "${var.dns_domain_name}"
  #statuses = ["ISSUED"]
}

# data "aws_acm_certificate" "example" {
#   domain   = "tf.example.com"
#   types = ["AMAZON_ISSUED"]
#   most_recent = true
# }
