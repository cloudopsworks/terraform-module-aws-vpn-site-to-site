##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

# is_hub: false # (Optional) Establish this is a HUB or spoke configuration, default is false
variable "is_hub" {
  type    = bool
  default = false
}

# spoke_def: "001" # (Optional) Spoke definition, default is "001"
variable "spoke_def" {
  type    = string
  default = "001"
}

# org: # (Required) Organization information
#   organization_name: "my-org" # (Required) Organization name
#   organization_unit: "my-ou" # (Required) Organization unit
#   environment_type: "prod" # (Required) Environment type
#   environment_name: "production" # (Required) Environment name
variable "org" {
  type = object({
    organization_name = string
    organization_unit = string
    environment_type  = string
    environment_name  = string
  })
}

# extra_tags: {} # (Optional) Extra tags to add to all resources, default is {}
variable "extra_tags" {
  type    = map(string)
  default = {}
}
