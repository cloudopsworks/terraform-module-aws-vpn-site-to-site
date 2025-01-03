##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

output "vpn_connection_id" {
  value = aws_vpn_connection.this.id
}

output "vpn_connection_arn" {
  value = aws_vpn_connection.this.arn
}

output "vpn_connection_customer_gateway_id" {
  value = aws_vpn_connection.this.customer_gateway_id
}

output "vpn_connection_vpn_gateway_id" {
  value = aws_vpn_connection.this.vpn_gateway_id
}

output "vpn_connection_transit_gateway_id" {
  value = aws_vpn_connection.this.transit_gateway_id
}

output "vpn_connection_transit_gateway_attachment_id" {
  value = aws_vpn_connection.this.transit_gateway_attachment_id
}

output "vpn_connection_tunnel1_address" {
  value = aws_vpn_connection.this.tunnel1_address
}

output "vpn_connection_tunnel1_cgw_inside_address" {
  value = aws_vpn_connection.this.tunnel1_cgw_inside_address
}

output "vpn_connection_tunnel1_vgw_inside_address" {
  value = aws_vpn_connection.this.tunnel1_vgw_inside_address
}

output "vpn_connection_tunnel1_preshared_key" {
  value     = aws_vpn_connection.this.tunnel1_preshared_key
  sensitive = true
}

output "vpn_connection_tunnel2_address" {
  value = aws_vpn_connection.this.tunnel2_address
}

output "vpn_connection_tunnel2_cgw_inside_address" {
  value = aws_vpn_connection.this.tunnel2_cgw_inside_address
}

output "vpn_connection_tunnel2_vgw_inside_address" {
  value = aws_vpn_connection.this.tunnel2_vgw_inside_address
}

output "vpn_connection_tunnel2_preshared_key" {
  value     = aws_vpn_connection.this.tunnel2_preshared_key
  sensitive = true
}

output "vpn_connection_routes" {
  value = aws_vpn_connection.this.routes
}

output "vpn_connection_telemetry" {
  value = aws_vpn_connection.this.vgw_telemetry
}