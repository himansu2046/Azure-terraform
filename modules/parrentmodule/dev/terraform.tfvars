rgs = {
  rg1 = {
    name     = "dev-rg"
    location = "Centralindia"
  }
  rg2 = {
    name     = "prd-rg"
    location = "Centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "Dev-vnet"
    location            = "Centralindia"
    resource_group_name = "prd-rg"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "Prd-vnet"
    location            = "Centralindia"
    resource_group_name = "prd-rg"
    address_space       = ["172.20.0.0/16"]
  }

  subnets = {
    subnet1 = {
      name                 = "public-subnet"
      resource_group_name  = "prd-rg"
      virtual_network_name = "Dev-vnet"
      address_prefixes     = ["10.0.1.0/24"]
    }
    subnet2 = {
      name                 = "privet-subnet"
      resource_group_name  = "prd-rg"
      virtual_network_name = "Dev-vnet"
      address_prefixes     = ["10.0.2.0/24"]
    }
  }

  nics = {
    nic1 = {
      name                          = "publivm_nic"
      location                      = "Centralindia"
      resource_group_name           = "prd-rg"
      ip_configuration              = "Internal"
      private_ip_address_allocation = "Dynamic"
      subnet_key                    = "subnet1"
    }
    nic2 = {
      name                          = "publivm_nic"
      location                      = "Centralindia"
      resource_group_name           = "prd-rg"
      ip_configuration              = "Internal"
      private_ip_address_allocation = "Dynamic"
      subnet_key                    = "subnet2"
    }
  }

  vms = {
    vm1 = {
      name                 = "Frontendvm"
      resource_group_name  = "prd-rg"
      location             = "centralindia"
      size                 = "Standard_DC2ds_v3"
      admin_username       = "Himansu"
      admin_password       = "Test@1234567"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      publisher            = "Canonical"
      offer                = "0001-com-ubuntu-server-jammy"
      sku                  = "22_04-lts-gen2"
      version              = "latest"
      nic_key              = "nic1"

    }

  }

}
