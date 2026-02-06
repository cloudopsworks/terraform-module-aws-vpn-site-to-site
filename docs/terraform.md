## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |
| <a name="module_tgw_routes"></a> [tgw\_routes](#module\_tgw\_routes) | git::https://github.com/cloudopsworks/terraform-module-aws-transit-gateway-routes.git// | v1.0.2 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.tunnel1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.tunnel2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.tunnel1_status](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.tunnel2_status](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.vpn_status](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_customer_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |
| [aws_ec2_tag.this_tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_vpn_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection) | resource |
| [aws_vpn_connection_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection_route) | resource |
| [aws_vpn_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway) | resource |
| [aws_vpn_gateway_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_attachment) | resource |
| [aws_vpn_gateway_route_propagation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_route_propagation) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_sns_topic.vpn_status](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sns_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | extra\_tags: {} # (Optional) Extra tags to add to all resources, default is {} | `map(string)` | `{}` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | is\_hub: false # (Optional) Establish this is a HUB or spoke configuration, default is false | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the VPN | `string` | `""` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The prefix to use for the VPN name | `string` | `""` | no |
| <a name="input_org"></a> [org](#input\_org) | org: # (Required) Organization information organization\_name: "my-org" # (Required) Organization name organization\_unit: "my-ou" # (Required) Organization unit environment\_type: "prod" # (Required) Environment type environment\_name: "production" # (Required) Environment name | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | The settings for the VPN | `any` | `{}` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | spoke\_def: "001" # (Optional) Spoke definition, default is "001" | `string` | `"001"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The VPC ID to deploy the VPN into | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_connection_arn"></a> [vpn\_connection\_arn](#output\_vpn\_connection\_arn) | n/a |
| <a name="output_vpn_connection_customer_gateway_id"></a> [vpn\_connection\_customer\_gateway\_id](#output\_vpn\_connection\_customer\_gateway\_id) | n/a |
| <a name="output_vpn_connection_id"></a> [vpn\_connection\_id](#output\_vpn\_connection\_id) | n/a |
| <a name="output_vpn_connection_routes"></a> [vpn\_connection\_routes](#output\_vpn\_connection\_routes) | n/a |
| <a name="output_vpn_connection_telemetry"></a> [vpn\_connection\_telemetry](#output\_vpn\_connection\_telemetry) | n/a |
| <a name="output_vpn_connection_transit_gateway_attachment_id"></a> [vpn\_connection\_transit\_gateway\_attachment\_id](#output\_vpn\_connection\_transit\_gateway\_attachment\_id) | n/a |
| <a name="output_vpn_connection_transit_gateway_id"></a> [vpn\_connection\_transit\_gateway\_id](#output\_vpn\_connection\_transit\_gateway\_id) | n/a |
| <a name="output_vpn_connection_tunnel1_address"></a> [vpn\_connection\_tunnel1\_address](#output\_vpn\_connection\_tunnel1\_address) | n/a |
| <a name="output_vpn_connection_tunnel1_cgw_inside_address"></a> [vpn\_connection\_tunnel1\_cgw\_inside\_address](#output\_vpn\_connection\_tunnel1\_cgw\_inside\_address) | n/a |
| <a name="output_vpn_connection_tunnel1_preshared_key"></a> [vpn\_connection\_tunnel1\_preshared\_key](#output\_vpn\_connection\_tunnel1\_preshared\_key) | n/a |
| <a name="output_vpn_connection_tunnel1_vgw_inside_address"></a> [vpn\_connection\_tunnel1\_vgw\_inside\_address](#output\_vpn\_connection\_tunnel1\_vgw\_inside\_address) | n/a |
| <a name="output_vpn_connection_tunnel2_address"></a> [vpn\_connection\_tunnel2\_address](#output\_vpn\_connection\_tunnel2\_address) | n/a |
| <a name="output_vpn_connection_tunnel2_cgw_inside_address"></a> [vpn\_connection\_tunnel2\_cgw\_inside\_address](#output\_vpn\_connection\_tunnel2\_cgw\_inside\_address) | n/a |
| <a name="output_vpn_connection_tunnel2_preshared_key"></a> [vpn\_connection\_tunnel2\_preshared\_key](#output\_vpn\_connection\_tunnel2\_preshared\_key) | n/a |
| <a name="output_vpn_connection_tunnel2_vgw_inside_address"></a> [vpn\_connection\_tunnel2\_vgw\_inside\_address](#output\_vpn\_connection\_tunnel2\_vgw\_inside\_address) | n/a |
| <a name="output_vpn_connection_vpn_gateway_id"></a> [vpn\_connection\_vpn\_gateway\_id](#output\_vpn\_connection\_vpn\_gateway\_id) | n/a |
