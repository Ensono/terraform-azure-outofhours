output "ACR-loginserver" {
  value = "${module.aks-registry.login_server}"
}

output "ACR-adminpw" {
  value = "${module.aks-registry.admin_password}"
}
