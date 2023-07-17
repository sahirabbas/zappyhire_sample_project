terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
  client_id         = var.client_id
  client_secret     = var.client_secret
}

resource "azurerm_resource_group" "zappyhire_rg" {
  name     = "aci-zappyhire-rg"
  location = "eastus"
}

resource "azurerm_container_group" "zappyhire_cgrp" {
  name                = "aci-zappyhire"
  location            = azurerm_resource_group.zappyhire_rg.location
  resource_group_name = azurerm_resource_group.zappyhire_rg.name
  ip_address_type     = "public"
  os_type             = "Linux"
  dns_name_label      = "aci-zappyhire-dns"

  container {
    name   = "mycontainer"
    image  = "sahirabbask/workshop:${var.image_tag}"
    cpu    = "1.0"
    memory = "1.5"
    ports {
      container_port = 80
      protocol = "TCP"
    }
  }

  image_registry_credential {
    server = "index.docker.io"
    username = var.docker_user
    password = var.docker_pass
  }
}

output "aci_dns" {
  value = azurerm_container_group.zappyhire_cgrp.fqdn
}

