##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

data "aws_sns_topic" "vpn_status" {
  count = try(var.settings.alarms.sns_topic, "") != "" && try(var.settings.alarms.enabled, false) ? 1 : 0
  name  = var.settings.alarms.sns_topic
}

resource "aws_cloudwatch_metric_alarm" "tunnel1_status" {
  count               = try(var.settings.alarms.enabled, false) ? 1 : 0
  alarm_name          = "${local.name} Tunnel 1 VPN Status"
  comparison_operator = "LessThanToThreshold"
  evaluation_periods  = "1"
  threshold           = "0.5"
  datapoints_to_alarm = "1"
  alarm_description   = "${local.name} VPN Status - Address: ${aws_vpn_connection.this.tunnel1_address} - Alarm if the VPN connection is not healthy"
  alarm_actions = flatten([
    try([data.aws_sns_topic.vpn_status[0].arn], [var.settings.alarms.sns_topic_arn], [])
  ])
  ok_actions = flatten([
    try([data.aws_sns_topic.vpn_status[0].arn], [var.settings.alarms.sns_topic_arn], [])
  ])
  metric_name = "TunnelState"
  namespace   = "AWS/VPN"
  dimensions = {
    VpnId           = aws_vpn_connection.this.id
    TunnelIpAddress = aws_vpn_connection.this.tunnel1_address
  }
  treat_missing_data        = "notBreaching"
  insufficient_data_actions = []
  tags                      = local.all_tags
}

resource "aws_cloudwatch_metric_alarm" "tunnel2_status" {
  count               = try(var.settings.alarms.enabled, false) ? 1 : 0
  alarm_name          = "${local.name} Tunnel 2 VPN Status"
  comparison_operator = "LessThanToThreshold"
  evaluation_periods  = "1"
  threshold           = "0.5"
  datapoints_to_alarm = "1"
  alarm_description   = "${local.name} VPN Status - Address: ${aws_vpn_connection.this.tunnel2_address} - Alarm if the VPN connection is not healthy"
  alarm_actions = flatten([
    try([data.aws_sns_topic.vpn_status[0].arn], [var.settings.alarms.sns_topic_arn], [])
  ])
  ok_actions = flatten([
    try([data.aws_sns_topic.vpn_status[0].arn], [var.settings.alarms.sns_topic_arn], [])
  ])
  metric_name = "TunnelState"
  namespace   = "AWS/VPN"
  dimensions = {
    VpnId           = aws_vpn_connection.this.id
    TunnelIpAddress = aws_vpn_connection.this.tunnel2_address
  }
  treat_missing_data        = "notBreaching"
  insufficient_data_actions = []
  tags                      = local.all_tags
}
