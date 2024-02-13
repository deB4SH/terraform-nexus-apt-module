output "pull-user" {
    value = nexus_security_user.pull-user.userid
}

output "pull-user-pw" {
    value = random_password.pull-user-password.result
}

output "push-user" {
    value = nexus_security_user.push-user.userid
}

output "push-user-pw" {
    value = random_password.push-user-password.result
}