variable "resource_group_location" {}

variable "resource_group_name" {}

variable "create_resource" {
  default = true
  type = bool
}

variable "add_deletion_tags" {
  default = true
  type = bool
}


variable "tags_deletion_default_life_in_days" {
  default = 30
}

variable "add_ooh_tags" {
  default = true
  type = bool
}


variable "tags_ooh_permitted_shutdown_values" {
  type    = "list"
  default = [
              "shutdown",
              "scaledown",
              "delete",
              "donothing"
              ]
}

variable "tags_ooh_default_shutdown_value" {
  default = "donothing"
}
