# Define the New Relic alert policy
resource "newrelic_alert_policy" "infra-policy" {
  name = var.policy_name1
}
resource "newrelic_alert_policy" "apm-policy" {
  name = var.policy_name2
}
resource "newrelic_alert_policy" "browser-policy" {
  name = var.policy_name3
}

# Define NRQL alert conditions based on variables
resource "newrelic_nrql_alert_condition" "infra_Conditions" {
  count = length(var.conditions1)

  account_id                     = var.account_id
  policy_id                      = newrelic_alert_policy.infra-policy.id
  type                           = "static"
  name                           = var.conditions1[count.index].name
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 80
   aggregation_method             = "event_flow"
   aggregation_delay              = 60
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = var.conditions1[count.index].query
  }

  critical {
    operator              = "above"
    threshold             = var.conditions1[count.index].critical_threshold
    threshold_duration    = var.conditions1[count.index].critical_duration
    threshold_occurrences = var.conditions1[count.index].threshold_occurrences
  }

  warning {
    operator              = "above"
    threshold             = var.conditions1[count.index].warning_threshold
    threshold_duration    = var.conditions1[count.index].warning_duration
    threshold_occurrences = var.conditions1[count.index].threshold_occurrences
  }
}


resource "newrelic_nrql_alert_condition" "apm_Conditions" {
  count = length(var.conditions2)

  account_id                     = var.account_id
  policy_id                      = newrelic_alert_policy.apm-policy.id
  type                           = "static"
  name                           = var.conditions2[count.index].name
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 80
  aggregation_method             = "event_flow"
  aggregation_delay              = 60
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = var.conditions2[count.index].query
  }

  critical {
    operator              = "above"
    threshold             = var.conditions2[count.index].critical_threshold
    threshold_duration    = var.conditions2[count.index].critical_duration
    threshold_occurrences = var.conditions2[count.index].threshold_occurrences
  }

  warning {
    operator              = "above"
    threshold             = var.conditions2[count.index].warning_threshold
    threshold_duration    = var.conditions2[count.index].warning_duration
    threshold_occurrences = var.conditions2[count.index].threshold_occurrences
  }
}
resource "newrelic_nrql_alert_condition" "browser_Conditions" {
  count = length(var.conditions3)

  account_id                     = var.account_id
  policy_id                      = newrelic_alert_policy.browser-policy.id
  type                           = "static"
  name                           = var.conditions3[count.index].name
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 80
  aggregation_method             = "event_flow"
  aggregation_delay              = 60
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = var.conditions3[count.index].query
  }

  critical {
    operator              = "above"
    threshold             = var.conditions3[count.index].critical_threshold
    threshold_duration    = var.conditions3[count.index].critical_duration
    threshold_occurrences = var.conditions3[count.index].threshold_occurrences
  }

  warning {
    operator              = "above"
    threshold             = var.conditions3[count.index].warning_threshold
    threshold_duration    = var.conditions3[count.index].warning_duration
    threshold_occurrences = var.conditions3[count.index].threshold_occurrences
  }
}

resource "newrelic_alert_muting_rule" "foo-1-apm" {
    name = "Example Muting Rule"
    enabled = true
    description = "muting rule test."
    condition {
        conditions {
            attribute   = "product"
            operator    = "EQUALS"
            values      = ["apm-vs-relicstaurants"]
        }
        # conditions {
        #     attribute   = "targetId"
        #     operator    = "EQUALS"
        #     values      = ["Muted"]
        # }
        operator = "AND"
    }
    schedule {
      # start_time = "2021-01-28T15:30:00"
      # end_time = "2021-01-28T16:30:00"
       start_time = "2024-07-29T14:30:00"
      end_time   = "2024-07-29T15:30:00"
      time_zone = "Asia/Kolkata"
      repeat = "WEEKLY"
      weekly_repeat_days = ["SUNDAY", "WEDNESDAY", "FRIDAY"]
      repeat_count = 42
    }
}

resource "newrelic_alert_muting_rule" "foo-1-brow" {
    name = "Example Muting Rule browser"
    enabled = true
    description = "muting rule test.browser"
    condition {
        conditions {
            attribute   = "product"
            operator    = "EQUALS"
            values      = ["browser-res1112"]
        }
        # conditions {
        #     attribute   = "targetId"
        #     operator    = "EQUALS"
        #     values      = ["Muted"]
        # }
        operator = "AND"
    }
    schedule {
      # start_time = "2021-01-28T15:30:00"
      # end_time = "2021-01-28T16:30:00"
       start_time = "2024-07-24T15:30:00"
      end_time   = "2024-07-24T16:30:00"
      time_zone = "Asia/Kolkata"
      repeat = "WEEKLY"
      weekly_repeat_days = ["SUNDAY", "WEDNESDAY", "FRIDAY"]
      repeat_count = 42
    }
}

resource "newrelic_alert_muting_rule" "foo-1-infra" {
    name = "Example Muting Rule infra"
    enabled = true
    description = "muting rule test infra."
    condition {
        conditions {
            attribute   = "product"
            operator    = "EQUALS"
            values      = ["DESKTOP-VG81DSE"]
        }
        # conditions {
        #     attribute   = "targetId"
        #     operator    = "EQUALS"
        #     values      = ["Muted"]
        # }
        operator = "AND"
    }
    schedule {
      # start_time = "2021-01-28T15:30:00"
      # end_time = "2021-01-28T16:30:00"
       start_time = "2024-07-29T19:30:00"
      end_time   = "2024-07-29T20:30:00"
      time_zone = "Asia/Kolkata"
      repeat = "WEEKLY"
      weekly_repeat_days = ["SUNDAY", "WEDNESDAY", "FRIDAY"]
      repeat_count = 42
    }
}


resource "newrelic_notification_destination" "foo" {
  account_id = 4438263
  name = "email-example"
  type = "EMAIL"

  property {
    key = "email"
    value = "wadhwaheena28@gmail.com"
  }
}

resource "newrelic_notification_channel" "foo" {
  account_id = 4438263
  name = "email-example"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.foo.id
  product = "IINT"

  property {
    key = "subject"
    value = "wadhwaheena28@gmail.com"
  }

  property {
    key = "customDetailsEmail"
    value = "issue id - {{issueId}}"
  }
}
resource "newrelic_workflow" "foo" {
  name = "workflow-example"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter-name"
    type = "FILTER"

    predicate {
      attribute = "accumulations.policyName"
      # attribute = "accumulations.tag.team"
      operator = "EXACTLY_MATCHES"
      values = ["apm-policy"]
      # values = [ "infra-policy" ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.foo.id
    
  }
  # policy_id = newrelic_alert_policy.infra-policy.id
}

resource "newrelic_service_level" "service_level" {
    guid = "NDQzODI2M3xCUk9XU0VSfEFQUExJQ0FUSU9OfDU5NDUwMzAxMg"
    name = "Browser Application Service Level"
    description = "Performance monitoring for the browser application."

    events {
        account_id = 4438263
        valid_events {
            from = "PageView"
            where = "entityGuid = 'NDQzODI2M3xCUk9XU0VSfEFQUExJQ0FUSU9OfDU5NDUwMzAxMg'"
        }
        good_events {
            from = "PageView"
            where = "entityGuid = 'NDQzODI2M3xCUk9XU0VSfEFQUExJQ0FUSU9OfDU5NDUwMzAxMg' AND result='SUCCESS'"
        }
    }

    objective {
        target = 40.00
        time_window {
            rolling {
                count = 1
                unit = "DAY"
            }
        }
    }
}