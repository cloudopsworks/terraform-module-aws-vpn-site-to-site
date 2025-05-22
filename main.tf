##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  name       = var.name_prefix == "" ? var.name : "${var.name_prefix}-${local.system_name}-vpn"
  cg_name    = var.name_prefix == "" ? "${var.name}-custgw" : "${var.name_prefix}-${local.system_name}-custgw"
  vpcgw_name = var.name_prefix == "" ? "${var.name}-gw" : "${var.name_prefix}-${local.system_name}-gw"
  tgw_assoc_name = try(var.settings.transit_gateway_id, "") != "" ? {
    Name = var.name_prefix == "" ? "${var.name}-tgw-vpn" : "${var.name_prefix}-${local.system_name}-tgw-vpn"
  } : {}
}

resource "aws_customer_gateway" "this" {
  count            = try(var.settings.customer_gateway.enabled, true) ? 1 : 0
  device_name      = try(var.settings.customer_gateway.device_name, local.name)
  bgp_asn          = try(var.settings.customer_gateway.bgp_asn, null)
  bgp_asn_extended = try(var.settings.customer_gateway.bgp_asn_extended, null)
  ip_address       = var.settings.customer_gateway.ip_address
  type             = try(var.settings.type, "ipsec.1")
  certificate_arn  = try(var.settings.customer_gateway.certificate_arn, null)
  tags = merge({
    Name = local.cg_name
    },
    local.all_tags
  )
}

resource "aws_vpn_gateway" "this" {
  count             = try(var.settings.vpn_gateway.enabled, true) && try(var.vpc.vpc_id, "") != "" ? 1 : 0
  vpc_id            = var.vpc.id
  availability_zone = try(var.settings.vpn_gateway.availability_zone, null)
  tags = merge({
    Name = local.vpcgw_name
    },
    local.all_tags
  )
}

resource "aws_vpn_connection" "this" {
  customer_gateway_id      = length(aws_customer_gateway.this) > 0 ? aws_customer_gateway.this[0].id : try(var.settings.customer_gateway.id, null)
  type                     = try(var.settings.type, "ipsec.1")
  transit_gateway_id       = try(var.settings.transit_gateway_id, null)
  vpn_gateway_id           = length(aws_vpn_gateway.this) > 0 ? aws_vpn_gateway.this[0].id : try(var.settings.vpn_gateway.id, null)
  static_routes_only       = try(var.settings.static_routes_only, null)
  enable_acceleration      = try(var.settings.enable_acceleration, null)
  local_ipv4_network_cidr  = try(var.settings.local.ipv4_network_cidr, null)
  local_ipv6_network_cidr  = try(var.settings.local.ipv6_network_cidr, null)
  remote_ipv4_network_cidr = try(var.settings.remote.ipv4_network_cidr, null)
  remote_ipv6_network_cidr = try(var.settings.remote.ipv6_network_cidr, null)
  outside_ip_address_type  = try(var.settings.outside_ip_address_type, null)
  tunnel_inside_ip_version = try(var.settings.tunnel_inside_ip_version, null)
  # Tunnel 1
  tunnel1_inside_cidr                     = try(var.settings.tunnel1.inside_cidr, null)
  tunnel1_inside_ipv6_cidr                = try(var.settings.tunnel1.inside_ipv6_cidr, null)
  tunnel1_preshared_key                   = try(var.settings.tunnel1.preshared_key, null)
  tunnel1_dpd_timeout_action              = try(var.settings.tunnel1.dpd_timeout_action, null)
  tunnel1_dpd_timeout_seconds             = try(var.settings.tunnel1.dpd_timeout_seconds, null)
  tunnel1_enable_tunnel_lifecycle_control = try(var.settings.tunnel1.enable_tunnel_lifecycle_control, null)
  tunnel1_ike_versions                    = try(var.settings.tunnel1.ike_versions, null)
  tunnel1_phase1_dh_group_numbers         = try(var.settings.tunnel1.phase1.dh_group_numbers, null)
  tunnel1_phase1_encryption_algorithms    = try(var.settings.tunnel1.phase1.encryption_algorithms, null)
  tunnel1_phase1_integrity_algorithms     = try(var.settings.tunnel1.phase1.integrity_algorithms, null)
  tunnel1_phase1_lifetime_seconds         = try(var.settings.tunnel1.phase1.lifetime_seconds, null)
  tunnel1_phase2_dh_group_numbers         = try(var.settings.tunnel1.phase2.dh_group_numbers, null)
  tunnel1_phase2_encryption_algorithms    = try(var.settings.tunnel1.phase2.encryption_algorithms, null)
  tunnel1_phase2_integrity_algorithms     = try(var.settings.tunnel1.phase2.integrity_algorithms, null)
  tunnel1_phase2_lifetime_seconds         = try(var.settings.tunnel1.phase2.lifetime_seconds, null)
  tunnel1_rekey_fuzz_percentage           = try(var.settings.tunnel1.rekey_fuzz_percentage, null)
  tunnel1_rekey_margin_time_seconds       = try(var.settings.tunnel1.rekey_margin_time_seconds, null)
  tunnel1_replay_window_size              = try(var.settings.tunnel1.replay_window_size, null)
  tunnel1_startup_action                  = try(var.settings.tunnel1.startup_action, null)
  dynamic "tunnel1_log_options" {
    for_each = try(var.settings.tunnel1.log.enabled, false) ? [1] : []
    content {
      cloudwatch_log_options {
        log_enabled       = var.settings.tunnel1.log.enabled
        log_group_arn     = try(var.settings.tunnel1.log.log_group_arn, "") != "" ? var.settings.tunnel1.log.log_group_arn : aws_cloudwatch_log_group.tunnel1[0].arn
        log_output_format = try(var.settings.tunnel1.log.output_format, "json")
      }
    }
  }
  # Tunnel 2
  tunnel2_inside_cidr                     = try(var.settings.tunnel2.inside_cidr, null)
  tunnel2_inside_ipv6_cidr                = try(var.settings.tunnel2.inside_ipv6_cidr, null)
  tunnel2_preshared_key                   = try(var.settings.tunnel2.preshared_key, null)
  tunnel2_dpd_timeout_action              = try(var.settings.tunnel2.dpd_timeout_action, null)
  tunnel2_dpd_timeout_seconds             = try(var.settings.tunnel2.dpd_timeout_seconds, null)
  tunnel2_enable_tunnel_lifecycle_control = try(var.settings.tunnel2.enable_tunnel_lifecycle_control, null)
  tunnel2_ike_versions                    = try(var.settings.tunnel2.ike_versions, null)
  tunnel2_phase1_dh_group_numbers         = try(var.settings.tunnel2.phase1.dh_group_numbers, null)
  tunnel2_phase1_encryption_algorithms    = try(var.settings.tunnel2.phase1.encryption_algorithms, null)
  tunnel2_phase1_integrity_algorithms     = try(var.settings.tunnel2.phase1.integrity_algorithms, null)
  tunnel2_phase1_lifetime_seconds         = try(var.settings.tunnel2.phase1.lifetime_seconds, null)
  tunnel2_phase2_dh_group_numbers         = try(var.settings.tunnel2.phase2.dh_group_numbers, null)
  tunnel2_phase2_encryption_algorithms    = try(var.settings.tunnel2.phase2.encryption_algorithms, null)
  tunnel2_phase2_integrity_algorithms     = try(var.settings.tunnel2.phase2.integrity_algorithms, null)
  tunnel2_phase2_lifetime_seconds         = try(var.settings.tunnel2.phase2.lifetime_seconds, null)
  tunnel2_rekey_fuzz_percentage           = try(var.settings.tunnel2.rekey_fuzz_percentage, null)
  tunnel2_rekey_margin_time_seconds       = try(var.settings.tunnel2.rekey_margin_time_seconds, null)
  tunnel2_replay_window_size              = try(var.settings.tunnel2.replay_window_size, null)
  tunnel2_startup_action                  = try(var.settings.tunnel2.startup_action, null)
  dynamic "tunnel2_log_options" {
    for_each = try(var.settings.tunnel2.log.enabled, false) ? [1] : []
    content {
      cloudwatch_log_options {
        log_enabled       = var.settings.tunnel2.log.enabled
        log_group_arn     = try(var.settings.tunnel2.log.log_group_arn, "") != "" ? var.settings.tunnel2.log.log_group_arn : aws_cloudwatch_log_group.tunnel2[0].arn
        log_output_format = try(var.settings.tunnel2.log.output_format, "json")
      }
    }
  }

  tags = merge({
    Name = local.name
    },
    local.all_tags
  )
}

resource "aws_cloudwatch_log_group" "tunnel1" {
  count             = try(var.settings.tunnel1.log.enabled, false) ? 1 : 0
  name              = "/aws/vpn/${local.name}-tunnel1"
  retention_in_days = try(var.settings.tunnel1.log.retention_in_days, 30)
  tags              = local.all_tags
}

resource "aws_cloudwatch_log_group" "tunnel2" {
  count             = try(var.settings.tunnel2.log.enabled, false) ? 1 : 0
  name              = "/aws/vpn/${local.name}-tunnel2"
  retention_in_days = try(var.settings.tunnel2.log.retention_in_days, 30)
  tags              = local.all_tags
}

resource "aws_ec2_tag" "this_tgw" {
  depends_on = [aws_vpn_connection.this]
  for_each = merge({
    for k, v in local.all_tags : k => v
    if try(var.settings.transit_gateway_id, "") != ""
  }, local.tgw_assoc_name)
  resource_id = aws_vpn_connection.this.transit_gateway_attachment_id
  key         = each.key
  value       = each.value
}

module "tgw_routes" {
  count                          = try(var.settings.transit_gateway_id, "") != "" ? 1 : 0
  source                         = "git::https://github.com/cloudopsworks/terraform-module-aws-transit-gateway-routes.git//?ref=v1.0.2"
  org                            = var.org
  spoke_def                      = var.spoke_def
  vpc_route_table_ids            = try(var.vpc.route_table_ids, [])
  tgw_destination_cidr           = try(var.settings.transit_gateway.tgw_destination_cidr, null)
  transit_gateway_id             = var.settings.transit_gateway_id
  create_association             = try(var.settings.transit_gateway.create_association, true)
  transit_gateway_attachment_id  = aws_vpn_connection.this.transit_gateway_attachment_id
  transit_gateway_route_table_id = var.settings.transit_gateway.route_table_id
  transit_gateway_routes         = var.settings.transit_gateway.routes
  extra_tags                     = var.extra_tags
}

resource "aws_vpn_connection_route" "this" {
  count                  = length(try(var.settings.routes, []))
  destination_cidr_block = var.settings.routes[count.index].destination_cidr_block
  vpn_connection_id      = aws_vpn_connection.this.id
}