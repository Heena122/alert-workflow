variable "account_id" {
  description = "New Relic Account ID"
  type        = number
}

variable "policy_name1" {
  description = "Name of the New Relic alert policy"
  type        = string
}
variable "policy_name2" {
  description = "Name of the New Relic alert policy"
  type        = string
}
variable "policy_name3" {
  description = "Name of the New Relic alert policy"
  type        = string
}

variable "app_name" {
  description = "Name of the application to monitor"
  type        = string
}

variable "conditions1" {
  description = "List of alert conditions"
  type        = list(object({
    name                 = string
    query                = string
    critical_threshold   = number
    critical_duration    = number
    warning_threshold    = number
    warning_duration     = number
    threshold_occurrences = string
  }))
}

variable "conditions2" {
  description = "List of alert conditions"
  type        = list(object({
    name                 = string
    query                = string
    critical_threshold   = number
    critical_duration    = number
    warning_threshold    = number
    warning_duration     = number
    threshold_occurrences = string
  }))
}
variable "conditions3" {
  description = "List of alert conditions"
  type        = list(object({
    name                 = string
    query                = string
    critical_threshold   = number
    critical_duration    = number
    warning_threshold    = number
    warning_duration     = number
    threshold_occurrences = string
  }))
}