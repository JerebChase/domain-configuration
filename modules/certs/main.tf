terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

resource "aws_acm_certificate" "prod_cert" {
  domain_name       = var.prod_cert_domain
  validation_method = "DNS"
}

resource "aws_acm_certificate" "dev_cert" {
  domain_name       = var.dev_cert_domain
  validation_method = "DNS"
}

resource "cloudflare_dns_record" "dev_domain_validation" {
  for_each = {
    for dvo in aws_acm_certificate.dev_cert.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      value = dvo.resource_record_value
      type  = dvo.resource_record_type
    }
  }

  zone_id = var.zone_id
  name    = each.value.name
  content = each.value.value
  type    = each.value.type
  ttl     = 300
}

resource "cloudflare_dns_record" "prod_domain_validation" {
  for_each = {
    for dvo in aws_acm_certificate.prod_cert.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      value = dvo.resource_record_value
      type  = dvo.resource_record_type
    }
  }

  zone_id = var.zone_id
  name    = each.value.name
  content = each.value.value
  type    = each.value.type
  ttl     = 300
}