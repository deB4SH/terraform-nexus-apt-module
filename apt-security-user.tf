resource "random_password" "pull-user-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_password" "push-user-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "nexus_security_user" "pull-user" {
  userid     = "apt-${var.name}-pull"
  firstname  = "APT Pull"
  lastname   = "${var.name}"
  email      = "svc.apt.${var.name}-pull@local.lan"
  password   = random_password.pull-user-password.result
  roles      = ["apt-${var.name}-pull-role"]
  status     = "active"
  depends_on = [nexus_repository_apt_hosted.repository, nexus_security_role.security-role-pull]
}

resource "nexus_security_user" "push-user" {
  userid     = "apt-${var.name}-push"
  firstname  = "APT Push"
  lastname   = "${var.name}"
  email      = "svc.apt.${var.name}-push@local.lan"
  password   = random_password.push-user-password.result
  roles      = ["apt-${var.name}-push-role"]
  status     = "active"
  depends_on = [nexus_repository_apt_hosted.repository, nexus_security_role.security-role-push]
}