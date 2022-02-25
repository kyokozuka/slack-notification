data "archive_file" "slack_notification_archive" {
    type        = var.archive_type
    source_dir  = var.source_dir
    output_path = var.output_path
}

resource "google_cloudfunctions_function" "slack_notification_function" {
    name        = var.name
    description = "slack notification"
    runtime     = var.runtime
    
    available_memory_mb   = 128
    source_archive_bucket = google_storage_bucket.slack_notification_bucket.name
    source_archive_object = google_storage_bucket_object.slack_notification_archive.name
    #   trigger_http          = true
    event_trigger {
        event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
        resource   = google_pubsub_topic.slack_notification_topic.name
    }
    entry_point           = var.entry_point
    environment_variables = {
        SLACK_WEB_HOOK_URL = var.webhook
    }
}
 
resource "google_cloudfunctions_function_iam_member" "slack_notification_invoker" {
    project        = google_cloudfunctions_function.slack_notification_function.project
    region         = google_cloudfunctions_function.slack_notification_function.region
    cloud_function = google_cloudfunctions_function.slack_notification_function.name
    
    role   = "roles/cloudfunctions.invoker"
    member = "allUsers"
}