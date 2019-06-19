output "registry_id" {
  value = "${element(concat(azurerm_container_registry.registry.*.id, list("")), 0)}"
}

output "login_server" {
  value = "${element(concat(azurerm_container_registry.registry.*.login_server, list("")), 0)}"
}

output "admin_username" {
  value = "${element(concat(azurerm_container_registry.registry.*.admin_username, list("")), 0)}"
}

output "admin_password" {
  value = "${element(concat(azurerm_container_registry.registry.*.admin_password, list("")), 0)}"
}
