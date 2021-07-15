provider "azurerm" {
  features {}
subscription_id = "3c990c80-ea36-4c6c-afb2-da328349c3ac"
client_id = "acd1e968-cf26-43c7-9ed8-fa583e44d29b"
client_secret = "6K62P7J~T.86-6IJl8-UnaTk~vQO9S96Pc"
tenant_id = "4c0495a4-a1a3-4901-8cc1-9f37bab59629"

}

resource "azurerm_resource_group" "main" {
  name     = "terraformnew"
  location = "Central India"
}

resource "azurerm_virtual_network" "main" {
  name                = "gautham-network"
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "gautham-nic"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "gautham-vm"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_D2s_v3"
  admin_username                  = "gautham"
  admin_password                  = "Test$1234"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
