##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  alarm_priority = try(var.settings.alarms.priority, 1)
}

data "aws_sns_topic" "vpn_status" {
  count = length(try(var.settings.alarms.sns_topics, [])) > 0 && try(var.settings.alarms.enabled, false) ? length(try(var.settings.alarms.sns_topics, [])) : 0
  name  = var.settings.alarms.sns_topics[count.index]
}

resource "aws_cloudwatch_metric_alarm" "vpn_status" {
  count               = try(var.settings.alarms.enabled, false) && !try(var.settings.alarms.for_each_tunnel, false) ? 1 : 0
  alarm_name          = "[P${local.alarm_priority}] VPN Status - ${local.name}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  threshold           = try(var.settings.alarms.threshold, "1")
  datapoints_to_alarm = "1"
  alarm_description   = "VPN Status for ${local.name} - Address: ${aws_vpn_connection.this.tunnel1_address} - Alarm if the VPN connection is not healthy"
  alarm_actions = flatten([
    try(data.aws_sns_topic.vpn_status.*.arn, var.settings.alarms.sns_topic_arns, [])
  ])
  ok_actions = flatten([
    try(data.aws_sns_topic.vpn_status.*.arn, var.settings.alarms.sns_topic_arns, [])
  ])
  metric_name = "TunnelState"
  namespace   = "AWS/VPN"
  statistic   = "Maximum"
  period      = 300
  dimensions = {
    VpnId = aws_vpn_connection.this.id
  }
  treat_missing_data        = "notBreaching"
  insufficient_data_actions = []
  tags                      = merge(local.all_tags, { alarm_priority = local.alarm_priority })
}

resource "aws_cloudwatch_metric_alarm" "tunnel1_status" {
  count               = try(var.settings.alarms.enabled, false) && try(var.settings.alarms.for_each_tunnel, false) ? 1 : 0
  alarm_name          = "[P${local.alarm_priority}] VPN Status - ${local.name} Tunnel 1"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  threshold           = try(var.settings.alarms.threshold, "1")
  datapoints_to_alarm = "1"
  alarm_description   = "VPN Status for ${local.name} - Address: ${aws_vpn_connection.this.tunnel1_address} - Alarm if the VPN connection is not healthy"
  alarm_actions = flatten([
    try(data.aws_sns_topic.vpn_status.*.arn, var.settings.alarms.sns_topic_arns, [])
  ])
  ok_actions = flatten([
    try(data.aws_sns_topic.vpn_status.*.arn, var.settings.alarms.sns_topic_arns, [])
  ])
  metric_name = "TunnelState"
  namespace   = "AWS/VPN"
  statistic   = "Maximum"
  period      = 300
  dimensions = {
    VpnId           = aws_vpn_connection.this.id
    TunnelIpAddress = aws_vpn_connection.this.tunnel1_address
  }
  treat_missing_data        = "notBreaching"
  insufficient_data_actions = []
  tags                      = merge(local.all_tags, { alarm_priority = local.alarm_priority })
}

resource "aws_cloudwatch_metric_alarm" "tunnel2_status" {
  count               = try(var.settings.alarms.enabled, false) && try(var.settings.alarms.for_each_tunnel, false) ? 1 : 0
  alarm_name          = "[P${local.alarm_priority}] VPN Status - ${local.name} Tunnel 2"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  threshold           = try(var.settings.alarms.threshold, "1")
  datapoints_to_alarm = "1"
  alarm_description   = "VPN Status for ${local.name} - Address: ${aws_vpn_connection.this.tunnel2_address} - Alarm if the VPN connection is not healthy"
  alarm_actions = flatten([
    try(data.aws_sns_topic.vpn_status.*.arn, var.settings.alarms.sns_topic_arns, [])
  ])
  ok_actions = flatten([
    try(data.aws_sns_topic.vpn_status.*.arn, var.settings.alarms.sns_topic_arns, [])
  ])
  metric_name = "TunnelState"
  namespace   = "AWS/VPN"
  statistic   = "Maximum"
  period      = 300
  dimensions = {
    VpnId           = aws_vpn_connection.this.id
    TunnelIpAddress = aws_vpn_connection.this.tunnel2_address
  }
  treat_missing_data        = "notBreaching"
  insufficient_data_actions = []
  tags                      = merge(local.all_tags, { alarm_priority = local.alarm_priority })
}
