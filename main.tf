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

module "caa" {
  source  = "./modules/caa"
  zone_id = var.zone_id
}

module "acm" {
  source          = "./modules/certs"
  dev_cert_domain = module.caa.dev_cert_domain
  prod_cert_domain = module.caa.prod_cert_domain
  zone_id         = var.zone_id
}