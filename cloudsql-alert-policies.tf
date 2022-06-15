resource "google_monitoring_alert_policy" "cloudsql_cpu" {
  project      = var.project
  display_name = "Cloud SQL CPU Alert Policy"
  enabled      = true

  notification_channels = [
    google_monitoring_notification_channel.slack_notifications.name
  ]

  alert_strategy {
    auto_close = "604800s"
  }

  combiner = "OR"

  conditions {
    display_name = "Cloud SQL Database - CPU utilization in TROUBLE"

    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.cloudsql_cpu_alert_policy_parameters.threshold_duration_trouble
      filter          = "metric.type=\"cloudsql.googleapis.com/database/cpu/utilization\" resource.type=\"cloudsql_database\" ${var.cloudsql_filter}"
      threshold_value = var.cloudsql_cpu_alert_policy_parameters.threshold_value_trouble

      aggregations {
        alignment_period   = "60s"
        group_by_fields    = []
        per_series_aligner = "ALIGN_MEAN"
      }

      trigger {
        count   = 1
        percent = 0
      }
    }
  }

  conditions {
    display_name = "Cloud SQL Database - CPU utilization in CRITICAL"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.cloudsql_cpu_alert_policy_parameters.threshold_duration_critical
      filter          = "metric.type=\"cloudsql.googleapis.com/database/cpu/utilization\" resource.type=\"cloudsql_database\" ${var.cloudsql_filter}"
      threshold_value = var.cloudsql_cpu_alert_policy_parameters.threshold_value_critical

      aggregations {
        alignment_period   = "60s"
        group_by_fields    = []
        per_series_aligner = "ALIGN_MEAN"
      }

      trigger {
        count   = 1
        percent = 0
      }
    }
  }

  documentation {
    content   = var.cloudsql_cpu_alert_policy_parameters.documentation
    mime_type = "text/markdown"
  }

  timeouts {}
}

resource "google_monitoring_alert_policy" "cloudsql_memory" {
  project      = var.project
  display_name = "Cloud SQL Memory Alert Policy"
  enabled      = true
  notification_channels = [
    google_monitoring_notification_channel.slack_notifications.name
  ]

  alert_strategy {
    auto_close = "604800s"
  }

  combiner = "OR"

  conditions {
    display_name = "Cloud SQL Database - Memory utilization in TROUBLE"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.cloudsql_mem_alert_policy_parameters.threshold_duration_trouble
      filter          = "metric.type=\"cloudsql.googleapis.com/database/memory/utilization\" resource.type=\"cloudsql_database\" ${var.cloudsql_filter}"
      threshold_value = var.cloudsql_mem_alert_policy_parameters.threshold_value_trouble

      aggregations {
        alignment_period   = "60s"
        group_by_fields    = []
        per_series_aligner = "ALIGN_MEAN"
      }

      trigger {
        count   = 1
        percent = 0
      }
    }
  }

  conditions {
    display_name = "Cloud SQL Database - Memory utilization in CRITICAL"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.cloudsql_mem_alert_policy_parameters.threshold_duration_critical
      filter          = "metric.type=\"cloudsql.googleapis.com/database/memory/utilization\" resource.type=\"cloudsql_database\" ${var.cloudsql_filter}"
      threshold_value = var.cloudsql_mem_alert_policy_parameters.threshold_value_critical

      aggregations {
        alignment_period   = "60s"
        group_by_fields    = []
        per_series_aligner = "ALIGN_MEAN"
      }

      trigger {
        count   = 1
        percent = 0
      }
    }
  }

  documentation {
    content   = var.cloudsql_mem_alert_policy_parameters.documentation
    mime_type = "text/markdown"
  }

  timeouts {}
}


resource "google_monitoring_alert_policy" "cloudsql_disk" {
  project      = var.project
  display_name = "Cloud SQL Disk Alert Policy"
  enabled      = true
  notification_channels = [
    google_monitoring_notification_channel.slack_notifications.name
  ]


  alert_strategy {
    auto_close = "604800s"
  }

  combiner = "OR"

  conditions {
    display_name = "Cloud SQL Database - Disk utilization in TROUBLE"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.cloudsql_disk_alert_policy_parameters.threshold_duration_trouble
      filter          = "metric.type=\"cloudsql.googleapis.com/database/disk/utilization\" resource.type=\"cloudsql_database\" ${var.cloudsql_filter}"
      threshold_value = var.cloudsql_disk_alert_policy_parameters.threshold_value_trouble

      aggregations {
        alignment_period   = "60s"
        group_by_fields    = []
        per_series_aligner = "ALIGN_MEAN"
      }

      trigger {
        count   = 1
        percent = 0
      }
    }
  }

  conditions {
    display_name = "Cloud SQL Database - Disk utilization in CRITICAL"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.cloudsql_disk_alert_policy_parameters.threshold_duration_critical
      filter          = "metric.type=\"cloudsql.googleapis.com/database/disk/utilization\" resource.type=\"cloudsql_database\" ${var.cloudsql_filter}"
      threshold_value = var.cloudsql_disk_alert_policy_parameters.threshold_value_critical

      aggregations {
        alignment_period   = "60s"
        group_by_fields    = []
        per_series_aligner = "ALIGN_MEAN"
      }

      trigger {
        count   = 1
        percent = 0
      }
    }
  }

  documentation {
    content   = var.cloudsql_disk_alert_policy_parameters.documentation
    mime_type = "text/markdown"
  }

  timeouts {}
}
