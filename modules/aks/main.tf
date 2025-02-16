resource "azurerm_kubernetes_cluster" "main" {
  name                = "main"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  kubernetes_version = "1.31.3"
  dns_prefix          = "dev"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    min_count = 1
    max_count = 10
    auto_scaling_enabled = true
  }

  aci_connector_linux {
    subnet_name = "/subscriptions/b3406e49-0e16-456d-a3bb-c324f1dfb0d5/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-Network/subnets/default"
  }

  identity {
    type = "SystemAssigned"
  }
}