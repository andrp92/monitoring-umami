
resource "google_monitoring_alert_policy" "vm_cpu" {
  display_name = "VM Instance CPU Alert Policy"
  project      = var.project
  enabled      = true


  notification_channels = [
    google_monitoring_notification_channel.slack_notifications.name
  ]

  alert_strategy {
    auto_close = var.vm_cpu_alert_policy_parameters.auto_close_interval
  }

  combiner = "OR"

  # trouble conditions
  conditions {
    display_name = "CPU Utilization for VM in TROUBLE"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.vm_cpu_alert_policy_parameters.threshold_duration_trouble
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\" ${var.vm_filter}"
      threshold_value = var.vm_cpu_alert_policy_parameters.threshold_value_trouble

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

  # critical conditions
  conditions {
    display_name = "CPU Utilization for VM in CRITICAL"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.vm_cpu_alert_policy_parameters.threshold_duration_critical
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\" ${var.vm_filter}"
      threshold_value = var.vm_cpu_alert_policy_parameters.threshold_value_critical

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
    content   = var.vm_cpu_alert_policy_parameters.documentation
    mime_type = "text/markdown"
  }

  timeouts {}
}


resource "google_monitoring_alert_policy" "vm_memory" {
  display_name = "VM Instance Memory Alert Policy"
  project      = var.project
  enabled      = true


  notification_channels = [
    google_monitoring_notification_channel.slack_notifications.name
  ]

  alert_strategy {
    auto_close = var.vm_mem_alert_policy_parameters.auto_close_interval
  }

  combiner = "OR"

  # trouble conditions
  conditions {
    display_name = "Memory Utilization for VM in TROUBLE"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.vm_mem_alert_policy_parameters.threshold_duration_trouble
      filter          = "metric.type=\"agent.googleapis.com/memory/percent_used\" resource.type=\"gce_instance\" metric.label.\"state\"=\"used\" ${var.vm_filter}"
      threshold_value = var.vm_mem_alert_policy_parameters.threshold_value_trouble

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

  # critical conditions
  conditions {
    display_name = "Memory Utilization for VM in CRITICAL"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.vm_mem_alert_policy_parameters.threshold_duration_critical
      filter          = "metric.type=\"agent.googleapis.com/memory/percent_used\" resource.type=\"gce_instance\" metric.label.\"state\"=\"used\" ${var.vm_filter}"
      threshold_value = var.vm_mem_alert_policy_parameters.threshold_value_critical

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
    content   = var.vm_mem_alert_policy_parameters.documentation
    mime_type = "text/markdown"
  }

  timeouts {}
}


resource "google_monitoring_alert_policy" "vm_disk" {
  display_name = "VM Instance Disk Alert Policy"
  project      = var.project
  enabled      = true

  notification_channels = [
    google_monitoring_notification_channel.slack_notifications.name
  ]

  alert_strategy {
    auto_close = var.vm_disk_alert_policy_parameters.auto_close_interval
  }

  combiner = "OR"

  # trouble conditionsf
  conditions {
    display_name = "Disk Utilization for VM in TROUBLE"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.vm_disk_alert_policy_parameters.threshold_duration_trouble
      filter          = "metric.type=\"agent.googleapis.com/disk/percent_used\" resource.type=\"gce_instance\" metric.label.\"state\"=\"used\" ${var.vm_filter} ${var.vm_disk_alert_policy_parameters.filter}"
      threshold_value = var.vm_disk_alert_policy_parameters.threshold_value_trouble

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

  # critical conditions
  conditions {
    display_name = "Disk Utilization for VM in CRITICAL"
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = var.vm_disk_alert_policy_parameters.threshold_duration_critical
      filter          = "metric.type=\"agent.googleapis.com/disk/percent_used\" resource.type=\"gce_instance\" metric.label.\"state\"=\"used\" ${var.vm_filter} ${var.vm_disk_alert_policy_parameters.filter}"
      threshold_value = var.vm_disk_alert_policy_parameters.threshold_value_critical

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
    content   = var.vm_disk_alert_policy_parameters.documentation
    mime_type = "text/markdown"
  }

  timeouts {}
}


