variable "location"             { type = string }
variable "resource_group_name"  { type = string }
variable "acr_name"             { type = string }
variable "storage_account_name" { type = string }
variable "aks_cluster_name"     { type = string }
variable "aks_dns_prefix"       { type = string }

variable "aks_node_count" {
    type    = number
    default = 3
}

variable "aks_node_vm_size" {
    type    = string
    default = "Standard_D2s_v3"
}

variable "environment" {
    type    = string
    default = "staging-production-cd"
}

variable "kubernetes_version" {
    default = "1.36.3"
}

variable "tags" {
    type = map(string)
    default = {
        Project   = "KoalaTech Course Platform"
        ManagedBy = "Terraform"
        Practical = "Week08"
    }
}
