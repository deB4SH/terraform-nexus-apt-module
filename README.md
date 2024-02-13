# terraform-nexus-apt-module
Terraform Module to create a apt repository in nexus with pull and push user.

NOTE: The provider is configured within the main terraform file.

## Example Usage:

The following listing shows a sample usage of this module.
```
module "apt-repository" {
  source = "github.com/deB4SH/terraform-nexus-apt-module?ref=1.0.0"

  for_each = { for repo in var.apt_repository : repo.name => repo}

  name = each.key
  isOnline = each.value.isOnline
  distribution = each.value.distribution
  signingKeypair = file("${path.module}/${each.value.signingKeypairFilepath}")
  signingPassphrase = each.value.signingPassphrase
  blobStoreName = each.value.blobStoreName
}
```
This uses an array definiton for all apt repositories that should be created.
```
variable "apt_repository" {
  type = list(object({
    name = string
    isOnline = bool
    distribution = string
    signingKeypairFilepath = string #path to file to load via  file("${path.module}/{path}")
    signingPassphrase = string
    blobStoreName = string
  }))
}
```

Where an example input may look like the following
```
apt_repository = [ 
    {
        name="apt-test1"
        isOnline = true
        distribution = "bookworm"
        signingKeypairFilepath = "gpg/private.gpg.key"
        signingPassphrase = ""
        blobStoreName = "default"
    },
    {
        name="apt-test2"
        isOnline = true
        distribution = "sid"
        signingKeypairFilepath = "gpg/private.gpg.key"
        signingPassphrase = ""
        blobStoreName = "default"
    } 
]
```

This will result in the following objects within nexus.
* apt repository: apt-test1
* apt repository: apt-test2
* role for apt pull on registry test1: apt-apt-test1-pull-role
* role for apt push on registry test1: apt-apt-test1-push-role
* role for apt pull on registry test2: apt-apt-test2-pull-role
* role for apt push on registry test2: apt-apt-test2-push-role
* user for pull on apt registry test1: apt-apt-test1-pull
* user for push on apt registry test1: apt-apt-apt-test1-push
* user for pull on apt registry test2: apt-apt-apt-test2-pull
* user for push on apt registry test2: apt-apt-test2-push