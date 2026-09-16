output "resource_group_name"  { value = data.azurerm_resource_group.rg.name }
output "acr_name"             { value = azurerm_container_registry.acr.name }
output "acr_login_server"     { value = azurerm_container_registry.acr.login_server }
output "storage_account_name" { value = azurerm_storage_account.storage_account.name }

output "storage_connection_string" {
    value     = azurerm_storage_account.storage_account.primary_connection_string
    sensitive = true
}

output "aks_cluster_name"   { value = azurerm_kubernetes_cluster.aks.name }
output "aks_resource_group" { value = data.azurerm_resource_group.rg.name }

output "github_actions_service_principal_client_id" {
    value = azuread_application.cd.client_id
}

output "azure_credentials_json" {
    sensitive = true
    value = jsonencode({
        clientId       = azuread_application.cd.client_id
        clientSecret   = azuread_application_password.cd.value
        subscriptionId = data.azurerm_client_config.current.subscription_id
        tenantId       = data.azurerm_client_config.current.tenant_id
    })
}
