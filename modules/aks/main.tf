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
    auto_scaling_enabled = true
    min_count = 2
    max_count = 10
    #pod_subnet_id = "/subscriptions/b3406e49-0e16-456d-a3bb-c324f1dfb0d5/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-Network/subnets/default"
    vnet_subnet_id = "/subscriptions/b3406e49-0e16-456d-a3bb-c324f1dfb0d5/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-Network/subnets/default"

  }

  aci_connector_linux {
    subnet_name = "/subscriptions/b3406e49-0e16-456d-a3bb-c324f1dfb0d5/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-Network/subnets/default"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr = "10.100.0.0/24"
    dns_service_ip = "10.100.0.100"
  }



  identity {
    type = "SystemAssigned"
  }
}