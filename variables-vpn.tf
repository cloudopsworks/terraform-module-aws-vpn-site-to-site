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

variable "settings" {
  description = "The settings for the VPN"
  type        = any
  default     = {}
}