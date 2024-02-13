resource "nexus_repository_apt_hosted" "repository" {
  name   = "${var.name}"
  online = var.isOnline

  distribution = "${var.distribution}"

  signing {
    keypair    = "${var.signingKeypair}"
    passphrase = "${var.signingPassphrase}"
  }

  storage {
    blob_store_name                = "${var.blobStoreName}"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}