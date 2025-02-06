terraform {
  cloud {
    organization = "jeremy-chase-brown"
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
