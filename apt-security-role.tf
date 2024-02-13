resource "nexus_security_role" "security-role-pull" {
  description = "APT Pull Role for ${var.name}"
  name        = "apt-${var.name}-pull-role"
  privileges = [
    "nx-repository-view-apt-${var.name}-read",
    "nx-repository-view-apt-${var.name}-browse",
  ]
  roleid = "apt-${var.name}-pull-role"
  depends_on = [nexus_repository_apt_hosted.repository]
}

resource "nexus_security_role" "security-role-push" {
  description = "APT Pull Role for ${var.name}"
  name        = "apt-${var.name}-pull-role"
  privileges = [
    "nx-repository-view-apt-${var.name}-read",
    "nx-repository-view-apt-${var.name}-browse",
    "nx-repository-view-apt-${var.name}-add",
  ]
  roleid = "apt-${var.name}-push-role"
  depends_on = [nexus_repository_apt_hosted.repository]
}