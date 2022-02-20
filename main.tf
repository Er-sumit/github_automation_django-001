# Documentation for github: https://github.com/hashicorp/setup-terraform
# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "own-space"
#
    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "open-source"
    }
  }
}
#
# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}