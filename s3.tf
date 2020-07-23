resource "aws_s3_bucket" "log" {
  bucket        = "${local.bucket_base_name}-logs"
  acl           = "log-delivery-write"
  tags          = "${local.tags}"
  #force_destroy = true
  # lifecycle {
  #   prevent_destroy = false
  # }
}

resource "aws_s3_bucket" "site" {
  bucket = "${local.bucket_base_name}"
  acl    = "public-read"
  policy = "${data.template_file.policy.rendered}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  logging {
    target_bucket = "${aws_s3_bucket.log.bucket}"
    target_prefix = "${local.bucket_base_name}"
  }

  tags          = "${local.tags}"
  #force_destroy = true
  # lifecycle {
  #   prevent_destroy = false
  # }
}

resource "aws_s3_bucket" "redirect" {
  bucket = "www.${local.bucket_base_name}"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "${aws_s3_bucket.site.website_endpoint}"
  }

  tags          = "${local.tags}"
  #force_destroy = true
  # lifecycle {
  #   prevent_destroy = false
  # }
}

resource "null_resource" "site_files" {
  triggers = {
    react_build = filemd5("${var.app_folder}/${var.file_app_md5}")
  }

  provisioner "local-exec" {
    command = "aws s3 cp s3://${var.bucket_artifact_traceability_name}/${local.project_version}.zip ${var.app_folder}/${local.project_version}.zip"
  }

  provisioner "local-exec" {
    command = "unzip ${var.app_folder}/${local.project_version}.zip -d ${var.app_folder}/ "
  }

  provisioner "local-exec" {
    command = "rm ${var.app_folder}/${local.project_version}.zip"
  }

  provisioner "local-exec" {
    command = "aws s3 sync ${var.app_folder}/${var.dist_folder}/ s3://${local.bucket_base_name}"
  }

  provisioner "local-exec" {
    command = "rm -rf ${var.app_folder}/"
  }

  depends_on = ["aws_s3_bucket.site"]
}