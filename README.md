# Slack notification
## Orverview
pub/subをトリガーにして、cloud functionからslackにメッセージを送る機能の環境構築

# Setting
## Add Parameters

### gcp/provider.tf
credential, projectの値を入れる。

### gcp/variables.tf
project_name, webhookに値を入れる。

# Run

~~~:sh
# Build
$ terraform init 
$ terraform apply

# Pub/Sub Run
$ gcloud pubsub topics publish slack-notification
~~~
