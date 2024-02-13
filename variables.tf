variable "name" {
    type = string
    description = "Name of the docker registry"

}

variable "isOnline" {
    type = bool
    default = true
    description = "Toggle switch to enable or disable online usage of this repository"

}

variable "distribution" {
    type = string
    description = "Name of the distribution"
    default = "bookworm"

}

variable "signingKeypair" {
    type = string
    description = "Key for signing packages"

}

variable "signingPassphrase" {
    type = string
    description = "Passphrase to decrypt keypair"

}

variable "blobStoreName" {
    type = string
    default = "default"
    description = "Blob Storage wihin nexus to use"

}