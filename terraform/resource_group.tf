#
# The account this practical runs under cannot create resource groups
# (same CloudLabs constraint as Week 07), and koalatech-aks-nc2026_group
# already exists (created in Week 07, confirmed empty) with the
# Contributor custom role already scoped to it - so it is read as a
# data source and reused rather than created.
#
data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
}
