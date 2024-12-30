##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

variable "name" {
  description = "The name of the VPN"
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "The prefix to use for the VPN name"
  type        = string
  default     = ""
}

variable "vpc" {
  description = "The VPC ID to deploy the VPN into"
  type        = any
  default     = {}
}

## VPN Settings in YAML format
# settings:
#   customer_gateway:
#     enabled: true
#     id: "cgw-12345678" # only required if you are using an existing customer gateway & enabled=false
#     device_name: "device-name"
#     bgp_asn: 65000
#     bgp_asn_extended: 65000
#     ip_address: "127.0.0.1"
#     certificate_arn: "arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012"
#   vpn_gateway:
#     enabled: true
#     id: "vgw-12345678" # only required if you are using an existing VPN gateway & enabled=false
#     availability_zone: "us-east-1a"
#   type: "ipsec.1"
#   transit_gateway_id: "tgw-12345678"
#   static_routes_only: true
#   enable_acceleration: true
#   local:
#     ipv4_network_cidr: "x.x.x.x/x"
#     ipv6_network_cidr: "xxxx:xxxx:xxxx::/x"
#   remote:
#     ipv4_network_cidr: "x.x.x.x/x"
#     ipv6_network_cidr: "xxxx:xxxx:xxxx::/x"
#   outside_ip_address_type: PublicIpv4 | PrivateIpv4
#   tunnel_inside_ip_version: ipv4 | ipv6
#   tunnel1:
#     inside_cidr: "x.x.x.x/x"
#     inside_ipv6_cidr: "xxxx:xxxx:xxxx::/x"
#     preshared_key: "preshared-key"
#     dpd_timeout_action: clear | none | restart
#     dpd_timeout_seconds: 30
#     enable_tunnel_lifecycle_control: true
#     ike_versions: ["ikev1", "ikev2"]
#     rekey_margin_time_seconds: 300
#     rekey_fuzz_percentage: 100
#     replay_window_size: 1024
#     startup_action: start | add
#     phase1:
#       dh_group_numbers: [2, 14, 15]
#       encryption_algorithms: ["aes128", "aes256"]
#       integrity_algorithms: ["sha1", "sha256"]
#       lifetime_seconds: 28800
#     phase2:
#       dh_group_numbers: [2, 14, 15]
#       encryption_algorithms: ["aes128", "aes256"]
#       integrity_algorithms: ["sha1", "sha256"]
#       lifetime_seconds: 3600
#     log:
#       enabled: true
#       cloudwatch_log_group_name: "vpn-logs" # Optional if not specified it creates new log group
#       output_format: "json"
#       retention_in_days: 30
#   tunnel2:
#     inside_cidr: "x.x.x.x/x"
#     inside_ipv6_cidr: "xxxx:xxxx:xxxx::/x"
#     preshared_key: "preshared-key"
#     dpd_timeout_action: clear | none | restart
#     dpd_timeout_seconds: 30
#     enable_tunnel_lifecycle_control: true
#     ike_versions: ["ikev1", "ikev2"]
#     rekey_margin_time_seconds: 300
#     rekey_fuzz_percentage: 100
#     replay_window_size: 1024
#     startup_action: start | add
#     phase1:
#       dh_group_numbers: [2, 14, 15]
#       encryption_algorithms: ["aes128", "aes256"]
#       integrity_algorithms: ["sha1", "sha256"]
#       lifetime_seconds: 28800
#     phase2:
#       dh_group_numbers: [2, 14, 15]
#       encryption_algorithms: ["aes128", "aes256"]
#       integrity_algorithms: ["sha1", "sha256"]
#       lifetime_seconds: 3600
#     log:
#       enabled: true
#       cloudwatch_log_group_name: "vpn-logs" # Optional if not specified it creates new log group
#       output_format: "json"
#       retention_in_days: 30
variable "settings" {
  description = "The settings for the VPN"
  type        = any
  default     = {}
}