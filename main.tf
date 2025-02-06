terraform {
  cloud {
    organization = "jeremy-chase-brown"
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.40.0"
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
  zone_name = var.zone_name
}
