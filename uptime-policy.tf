resource "google_monitoring_uptime_check_config" "https-check" {
  display_name = "https-uptime-check"
  timeout      = "10s"
  period       = "60s"

  http_check {
    port         = "443"
    use_ssl      = true
    validate_ssl = true
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = var.project
      host       = var.host_address
    }
  }
}


resource "google_monitoring_alert_policy" "https-health" {
  display_name = "APP HTTPS Alert Policy"
  project      = var.project
  enabled      = true

  notification_channels = [
    google_monitoring_notification_channel.slack_notifications.name,
    google_monitoring_notification_channel.email_notifications.name
  ]

  combiner = "OR"

  conditions {
    display_name = "App or SSL check failed"
    condition_threshold {
      filter          = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" AND resource.type=\"uptime_url\""
      duration        = "300s"
      comparison      = "COMPARISON_LT"
      threshold_value = "1"
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_COUNT_TRUE"
      }

      trigger {
        count = 1
      }
    }
  }
  alert_strategy {
    auto_close = "7200s"
  }
}
