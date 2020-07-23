output "bucket_site_name" {
  value = "${aws_s3_bucket.site.id}"
}

output "bucket_site_arn" {
  value = "${aws_s3_bucket.site.arn}"
}

output "bucket_site_tags" {
  value = "${aws_s3_bucket.site.tags}"
}

output "bucket_redirect_name" {
  value = "${aws_s3_bucket.redirect.id}"
}

output "bucket_redirect_arn" {
  value = "${aws_s3_bucket.redirect.arn}"
}

output "bucket_redirect_tags" {
  value = "${aws_s3_bucket.redirect.tags}"
}

output "bucket_log_name" {
  value = "${aws_s3_bucket.log.id}"
}

output "bucket_log_arn" {
  value = "${aws_s3_bucket.log.arn}"
}

output "bucket_log_tags" {
  value = "${aws_s3_bucket.log.tags}"
}