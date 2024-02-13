terraform {
  required_providers {
    nexus = {
      source = "datadrivers/nexus"
      version = "2.1.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}