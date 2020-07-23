locals {
  s3_origin_id     = "${aws_s3_bucket.site.bucket_regional_domain_name}"
  bucket_base_name = "${var.domain}-${var.env}-${var.envVersion}"
  project_version  = "${var.project}-${var.release}-${var.env}-${var.envVersion}"
  tags = {
    "environment"        = "${var.env}"
    "environmentVersion" = "${var.envVersion}"
    "product"            = "${var.product}"
    "role"               = "${var.role}"
    "createdBy"          = "${var.createdBy}"
    "owner"              = "${var.owner}"
    "project"            = "${var.project}"
    "version"            = "${var.release}"
  }
}