terraform {
  cloud {
    organization = "jeremy-chase-brown"
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "cloudflare" { }

# module "acm" {
#   source = "./modules/acm"
# }

module "cloudflare" {
  source    = "./modules/cloudflare"
  zone_id = var.zone_id
}
