#
# CI/CD service principal, Terraform-managed end to end (same discipline
# used to fix Task 7.1P). Needs more than 7.1P's ACR-only scope: it must
# push to ACR AND call az aks get-credentials AND kubectl apply/set image
# against the cluster. Contributor on the resource group covers both -
# kubectl itself then authenticates to the Kubernetes API with the client
# certificate that get-credentials returns, so no separate Kubernetes
# RBAC grant is needed on this non-AAD-RBAC cluster.
#
resource "azuread_application" "cd" {
    display_name = "koalatech-cd-sp-${var.aks_cluster_name}"
    owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "cd" {
    client_id = azuread_application.cd.client_id
    owners    = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_password" "cd" {
    application_id = azuread_application.cd.id
    display_name   = "github-actions-cd"
}

resource "azurerm_role_assignment" "cd_contributor" {
    principal_id         = azuread_service_principal.cd.object_id
    role_definition_name = "Contributor"
    scope                = data.azurerm_resource_group.rg.id
}
