terraform {
  backend "remote" {
    organization = "awslyall"

    workspaces {
      name = "development"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
