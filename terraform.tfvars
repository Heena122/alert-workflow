account_id  = 4438263
policy_name1 = "Infra-policy"
policy_name2 = "apm-policy"
policy_name3 = "browser-policy"
app_name    = "task"

conditions1 = [
  {
    name                 = "Infra-Cond-1"
    query                = "FROM StorageSample SELECT average(diskUsedPercent) WHERE `entityName` = 'DESKTOP-VG81DSE'"
    critical_threshold   = 16.736
    critical_duration    = 60
    warning_threshold    = 16.73
    warning_duration     = 60
    threshold_occurrences = "ALL"
  },
    {
    name                 = "Infra-Cond-2"
    query                = "FROM SystemSample SELECT average(cpuPercent) WHERE `entityName` = 'DESKTOP-VG81DSE'"
    critical_threshold   = 16.736
    critical_duration    = 60
    warning_threshold    = 16.73
    warning_duration     = 60
    threshold_occurrences = "ALL"
  },
    {
    name                 = "Infra-Cond-3"
    query                = "FROM NetworkSample SELECT average(receiveBytesPerSecond) WHERE `entityName` = 'DESKTOP-VG81DSE'"
    critical_threshold   = 16.736
    critical_duration    = 60
    warning_threshold    = 16.73
    warning_duration     = 60
    threshold_occurrences = "ALL"
  }

]

conditions2 = [
  {
    name                 = "apm-Cond-1"
    query                = "FROM Transaction SELECT apdex(duration, 0.5) WHERE appName = 'apm-vs-relicstaurants'"
    critical_threshold   = 7
    critical_duration    = 60
    warning_threshold    = 2
    warning_duration     = 60
    threshold_occurrences = "ALL"
  },
    {
    name                 = "apm-Cond-2"
    query                = "FROM Transaction SELECT rate(count(*), 1 minute) WHERE appName = 'apm-vs-relicstaurants'"
    critical_threshold   = 7
    critical_duration    = 60
    warning_threshold    = 2
    warning_duration     = 60
    threshold_occurrences = "ALL"
  },
    {
    name                 = "apm-Cond-3"
    query                = "FROM Transaction SELECT percentage(count(*), WHERE error IS true) WHERE appName = 'apm-vs-relicstaurants'"
    critical_threshold   = 7
    critical_duration    = 60
    warning_threshold    = 2
    warning_duration     = 60
    threshold_occurrences = "ALL"
  }

]

conditions3 = [
  {
    name                 = "browser-Cond-1"
    query                = "FROM JavaScriptError SELECT percentage(count(*), WHERE error IS NOT NULL)  WHERE appName = 'browser-res1112'"
    critical_threshold   = 2
    critical_duration    = 60
    warning_threshold    = 1
    warning_duration     = 60
    threshold_occurrences = "ALL"
  },
    {
    name                 = "browser-Cond-2"
    query                = "FROM PageView SELECT count(*) WHERE appName = 'browser-res1112'"
    critical_threshold   = 2
    critical_duration    = 60
    warning_threshold    = 1
    warning_duration     = 60
    threshold_occurrences = "ALL"
  },
    {
    name                 = "browser-Cond-3"
    query                = "FROM PageViewTiming SELECT percentile(largestContentfulPaint, 75) WHERE appName= 'browser-res1112'"
    critical_threshold   = 2
    critical_duration    = 60
    warning_threshold    = 1
    warning_duration     = 60
    threshold_occurrences = "ALL"
  }

]

