location            = "Australia East"
resource_group_name = "koalatech-aks-nc2026_group"

acr_name             = "pratiyushacr8p"
storage_account_name = "pratiyushsa8p"
aks_cluster_name     = "pratiyush-aks-8p"
aks_dns_prefix       = "pratiyush8p"

aks_node_count   = 3
aks_node_vm_size = "Standard_D2s_v3"

environment = "staging-production-cd"

tags = {
    Project   = "KoalaTech Course Platform"
    ManagedBy = "Terraform"
    Practical = "Week08"
}
