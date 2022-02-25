resource "google_pubsub_topic" "slack_notification_topic" {
    name      = var.name
    labels    = {
        name  = "slack-notification"
    }
}