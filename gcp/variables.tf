###############
# Project all
###############
variable "project_name" {
  type = string
  default = ""
}

variable "name" {
  type = string
  default = "slack-notification"
}

###############
# Cloud storage
###############
variable "bucket_name" {
  type = string
  default = "slack-notification"
}

variable "location" {
  type = string
  default = "ASIA"
}

###############
# Cloud functions
###############
variable "runtime" {
  type    = string
  default = "python39"
}

variable "webhook" {
  type    = string
  default = ""
}

variable "entry_point" {
  type    = string
  default = "slack_notification"
}

variable "archive_type" {
  type    = string
  default = "zip"
}

variable "source_dir" {
  type    = string
  default = "../src"
}

variable "output_path" {
  type    = string
  default = "../src/function.zip"
}