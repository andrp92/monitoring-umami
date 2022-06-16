
variable "project" {
  default = "analytics-353001"
}

variable "json_key_path" {
}

variable "slack-auth-token" {
}

variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default = [
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "osconfig.googleapis.com"
  ]
}

# vm policies
variable "vm_filter" {
    default = ""
}

variable "host_address" {
    default = "umami.andresrp.com"
}

variable "email_address" {
}

variable "vm_cpu_alert_policy_parameters" {
  default = {
    auto_close_interval         = "604800s",
    threshold_duration_trouble  = "300s",
    threshold_value_trouble     = 0.8,
    threshold_duration_critical = "300s",
    threshold_value_critical    = 0.9,
    documentation               = "Umami monitoring",
  }
}
variable "vm_mem_alert_policy_parameters" {
  default = {
    auto_close_interval         = "604800s",
    threshold_duration_trouble  = "300s",
    threshold_value_trouble     = 80,
    threshold_duration_critical = "300s",
    threshold_value_critical    = 90,
    documentation               = "Umami monitoring",
  }
}
variable "vm_disk_alert_policy_parameters" {
  default = {
    auto_close_interval         = "604800s",
    threshold_duration_trouble  = "300s",
    threshold_value_trouble     = 80,
    threshold_duration_critical = "300s",
    threshold_value_critical    = 90,
    filter                      = "metric.label.\"device\"!=monitoring.regex.full_match(\"/dev/loop.*\") metric.label.\"device\"!=monitoring.regex.full_match(\"loop.*\")"
    documentation               = "Umami monitoring",
  }
}

# cloudsql policies
variable "cloudsql_filter" {
    default = ""
}

variable "cloudsql_cpu_alert_policy_parameters" {
  default = {
    auto_close_interval         = "604800s",
    threshold_duration_trouble  = "300s",
    threshold_value_trouble     = 0.8,
    threshold_duration_critical = "300s",
    threshold_value_critical    = 0.9,
    documentation               = "Umami monitoring",
  }
}
variable "cloudsql_mem_alert_policy_parameters" {
  default = {
    auto_close_interval         = "604800s",
    threshold_duration_trouble  = "300s",
    threshold_value_trouble     = 0.8,
    threshold_duration_critical = "300s",
    threshold_value_critical    = 0.9,
    documentation               = "Umami monitoring",
  }
}
variable "cloudsql_disk_alert_policy_parameters" {
  default = {
    auto_close_interval         = "604800s",
    threshold_duration_trouble  = "300s",
    threshold_value_trouble     = 0.8,
    threshold_duration_critical = "300s",
    threshold_value_critical    = 0.9,
    filter                      = "metric.label.\"device\"!=monitoring.regex.full_match(\"/dev/loop.*\") metric.label.\"device\"!=monitoring.regex.full_match(\"loop.*\")"
    documentation               = "Umami monitoring",
  }
}
