data "azurerm_network_interface" "nic_loop" {
  for_each            = var.nic_data
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
