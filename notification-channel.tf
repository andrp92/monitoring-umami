# Setting up provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.24.0"
    }
  }
}
provider "google" {
  credentials = file("${var.json_key_path}")
  project     = var.project
}

# Enabling APIs for the service to run
resource "google_project_service" "project_services" {
  for_each                   = toset(var.activate_apis)
  project                    = var.project
  service                    = each.value
  disable_on_destroy         = false
  disable_dependent_services = false
}

# Notifications to Slack
resource "google_monitoring_notification_channel" "slack_notifications" {
  type         = "slack"
  display_name = "#tfe_support_channel"
  project      = var.project
  labels = {
    channel_name = "#umami-support-channel"
  }
  sensitive_labels {
    auth_token = var.slack-auth-token
  }
}

# Notifications to Email
resource "google_monitoring_notification_channel" "email_notifications" {
  type         = "email"
  display_name = "Email notifications"
  project      = var.project
  labels = {
    email_address = var.email_address
  }
}