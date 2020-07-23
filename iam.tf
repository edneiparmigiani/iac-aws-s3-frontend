data "template_file" "policy" {
  template = "${file("templates/policy.json")}"

  vars = {
    bucket_name = "${local.bucket_base_name}"
  }
}