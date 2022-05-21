terraform {
  cloud {
    organization = "own-space"

    workspaces {
      name = "Django-gh-actions-test"
    }
  }
}