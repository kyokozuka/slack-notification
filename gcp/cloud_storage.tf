resource "google_storage_bucket" "slack_notification_bucket" {
    name     = "${var.project_name}-${var.bucket_name}"
    location = var.location
}
 
resource "google_storage_bucket_object" "slack_notification_archive" {
    name   = "${var.name}-${data.archive_file.slack_notification_archive.output_md5}.zip"
    bucket = google_storage_bucket.slack_notification_bucket.name
    source = data.archive_file.slack_notification_archive.output_path
}
