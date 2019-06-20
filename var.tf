variable "resource_group_location" {}

variable "resource_group_name" {}

variable "create_resource" {
  default = true
  type = bool
}

#variable "deletion_date" {
#  default = formatdate("yyyy-MM-ddTHH:mm:ss.fffffffZ",timestamp())
#}