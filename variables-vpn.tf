##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

# name: "my-vpn" # (Optional) The name of the VPN, default is ""
variable "name" {
  description = "The name of the VPN"
  type        = string
  default     = ""
}

# name_prefix: "prefix" # (Optional) The prefix to use for the VPN name, default is ""
variable "name_prefix" {
  description = "The prefix to use for the VPN name"
  type        = string
  default     = ""
}

# vpc: # (Optional) The VPC ID to deploy the VPN into
#   vpc_id: "vpc-12345678" # (Required) The ID of the VPC
#   route_table_ids: ["rtb-12345678"] # (Optional) List of route table IDs for propagation
variable "vpc" {
  description = "The VPC ID to deploy the VPN into"
  type        = any
  default     = {}
}

## VPN Settings in YAML format
# settings:
#   alarms:
#     enabled: true # (Optional) if true, creates alarms for the VPN, default is false
#     priority: 1 # (Optional) priority of the alarm, default is 1
#     for_each_tunnel: true # (Optional) if true, creates alarms for each tunnel, default is false
#     sns_topics: ["topic1"] # (Optional) list of SNS topics to send alarms to
#     sns_topic_arns: ["arn:aws:sns:us-east-1:123456789012:topic1"] # (Optional) list of SNS topic ARNs to send alarms to
#     threshold: 1 # (Optional) threshold for the alarm, default is 1
#   customer_gateway:
#     enabled: true # (Optional) if true, creates a customer gateway, default is true
#     id: "cgw-12345678" # (Optional) only required if you are using an existing customer gateway & enabled=false
#     device_name: "device-name" # (Optional) name of the customer gateway device
#     bgp_asn: 65000 # (Optional) BGP ASN for the customer gateway
#     bgp_asn_extended: 65000 # (Optional) BGP ASN Extended for the customer gateway
#     ip_address: "1.2.3.4" # (Required) IP address of the customer gateway
#     certificate_arn: "arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012" # (Optional) Certificate ARN for the customer gateway
#   vpn_gateway:
#     enabled: false # (Optional) if true, creates a VPN gateway, default is false
#     id: "vgw-12345678" # (Optional) only required if you are using an existing VPN gateway & enabled=false
#     availability_zone: "us-east-1a" # (Optional) Availability zone for the VPN gateway
#     amazon_side_asn: 64512 # (Optional) Amazon side ASN for the VPN gateway
#     propagation:
#       enabled: false # (Optional) if true, enables route propagation, default is false
#   type: "ipsec.1" # (Optional) Type of VPN connection, default is "ipsec.1"
#   transit_gateway_id: "tgw-12345678" # (Optional) Transit gateway ID to attach the VPN to
#   static_routes_only: true # (Optional) Whether to use static routes only, default is null
#   enable_acceleration: true # (Optional) Whether to enable acceleration, default is null
#   local:
#     ipv4_network_cidr: "0.0.0.0/0" # (Optional) Local IPv4 network CIDR
#     ipv6_network_cidr: "::/0" # (Optional) Local IPv6 network CIDR
#   remote:
#     ipv4_network_cidr: "0.0.0.0/0" # (Optional) Remote IPv4 network CIDR
#     ipv6_network_cidr: "::/0" # (Optional) Remote IPv6 network CIDR
#   outside_ip_address_type: PublicIpv4 # (Optional) Outside IP address type (PublicIpv4 | PrivateIpv4)
#   tunnel_inside_ip_version: ipv4 # (Optional) Tunnel inside IP version (ipv4 | ipv6)
#   routes: # (Optional) List of static routes to create
#     - destination_cidr_block: "10.0.0.0/16" # (Required) Destination CIDR block
#   transit_gateway:
#     tgw_destination_cidr: "10.0.0.0/8" # (Optional) TGW destination CIDR
#     create_association: true # (Optional) Whether to create TGW association, default is true
#     route_table_id: "tgw-rtb-12345678" # (Optional) TGW route table ID
#     routes: [] # (Optional) List of TGW routes
#   tunnel1:
#     inside_cidr: "169.254.0.0/30" # (Optional) Inside IPv4 CIDR for tunnel 1
#     inside_ipv6_cidr: "fd00:ec2:80::/64" # (Optional) Inside IPv6 CIDR for tunnel 1
#     preshared_key: "key" # (Optional) Preshared key for tunnel 1
#     dpd_timeout_action: clear # (Optional) DPD timeout action (clear | none | restart)
#     dpd_timeout_seconds: 30 # (Optional) DPD timeout seconds
#     enable_tunnel_lifecycle_control: true # (Optional) Enable tunnel lifecycle control
#     ike_versions: ["ikev1", "ikev2"] # (Optional) List of supported IKE versions
#     rekey_margin_time_seconds: 300 # (Optional) Rekey margin time seconds
#     rekey_fuzz_percentage: 100 # (Optional) Rekey fuzz percentage
#     replay_window_size: 1024 # (Optional) Replay window size
#     startup_action: start # (Optional) Startup action (start | add)
#     phase1:
#       dh_group_numbers: [2, 14, 15] # (Optional) Phase 1 DH group numbers
#       encryption_algorithms: ["aes128", "aes256"] # (Optional) Phase 1 encryption algorithms
#       integrity_algorithms: ["sha1", "sha256"] # (Optional) Phase 1 integrity algorithms
#       lifetime_seconds: 28800 # (Optional) Phase 1 lifetime seconds
#     phase2:
#       dh_group_numbers: [2, 14, 15] # (Optional) Phase 2 DH group numbers
#       encryption_algorithms: ["aes128", "aes256"] # (Optional) Phase 2 encryption algorithms
#       integrity_algorithms: ["sha1", "sha256"] # (Optional) Phase 2 integrity algorithms
#       lifetime_seconds: 3600 # (Optional) Phase 2 lifetime seconds
#     log:
#       enabled: false # (Optional) Enable logging for tunnel 1, default is false
#       log_group_arn: "arn:aws:logs:us-east-1:123456789012:log-group:vpn-logs" # (Optional) CloudWatch log group ARN
#       output_format: "json" # (Optional) Log output format, default is "json"
#       retention_in_days: 30 # (Optional) Log retention in days, default is 30
#   tunnel2:
#     inside_cidr: "169.254.0.4/30" # (Optional) Inside IPv4 CIDR for tunnel 2
#     inside_ipv6_cidr: "fd00:ec2:80::/64" # (Optional) Inside IPv6 CIDR for tunnel 2
#     preshared_key: "key" # (Optional) Preshared key for tunnel 2
#     dpd_timeout_action: clear # (Optional) DPD timeout action (clear | none | restart)
#     dpd_timeout_seconds: 30 # (Optional) DPD timeout seconds
#     enable_tunnel_lifecycle_control: true # (Optional) Enable tunnel lifecycle control
#     ike_versions: ["ikev1", "ikev2"] # (Optional) List of supported IKE versions
#     rekey_margin_time_seconds: 300 # (Optional) Rekey margin time seconds
#     rekey_fuzz_percentage: 100 # (Optional) Rekey fuzz percentage
#     replay_window_size: 1024 # (Optional) Replay window size
#     startup_action: start # (Optional) Startup action (start | add)
#     phase1:
#       dh_group_numbers: [2, 14, 15] # (Optional) Phase 1 DH group numbers
#       encryption_algorithms: ["aes128", "aes256"] # (Optional) Phase 1 encryption algorithms
#       integrity_algorithms: ["sha1", "sha256"] # (Optional) Phase 1 integrity algorithms
#       lifetime_seconds: 28800 # (Optional) Phase 1 lifetime seconds
#     phase2:
#       dh_group_numbers: [2, 14, 15] # (Optional) Phase 2 DH group numbers
#       encryption_algorithms: ["aes128", "aes256"] # (Optional) Phase 2 encryption algorithms
#       integrity_algorithms: ["sha1", "sha256"] # (Optional) Phase 2 integrity algorithms
#       lifetime_seconds: 3600 # (Optional) Phase 2 lifetime seconds
#     log:
#       enabled: false # (Optional) Enable logging for tunnel 2, default is false
#       log_group_arn: "arn:aws:logs:us-east-1:123456789012:log-group:vpn-logs" # (Optional) CloudWatch log group ARN
#       output_format: "json" # (Optional) Log output format, default is "json"
#       retention_in_days: 30 # (Optional) Log retention in days, default is 30
variable "settings" {
  description = "The settings for the VPN"
  type        = any
  default     = {}
}