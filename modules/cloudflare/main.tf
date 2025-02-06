terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

data "cloudflare_zone" "main_zone" {
  filter = {
    name = var.zone_name
  }
}

resource "cloudflare_dns_record" "caa_root" {
  zone_id = data.cloudflare_zone.main_zone.zone_id
  name    = var.zone_name
  type    = "CAA"
  ttl     = 300
  data    = {
    flag  = 0
    tag   = "issue"
    value = "amazonaws.com"
  }
}

resource "cloudflare_dns_record" "caa_subdomain" {
  zone_id = data.cloudflare_zone.main_zone.zone_id
  name    = "*.${var.zone_name}"
  type    = "CAA"
  ttl     = 300
  data    = {
    flag  = 0
    tag   = "issue"
    value = "amazonaws.com"
  }
}

resource "cloudflare_dns_record" "caa_root_wildcard" {
  zone_id = data.cloudflare_zone.main_zone.zone_id
  name    = var.zone_name
  type    = "CAA"
  ttl     = 300
  data    = {
    flag  = 0
    tag   = "issuewild"
    value = "amazonaws.com"
  }
}

resource "cloudflare_dns_record" "caa_subdomain_wildcard" {
  zone_id = data.cloudflare_zone.main_zone.zone_id
  name    = "*.${var.zone_name}"
  type    = "CAA"
  ttl     = 300
  data    = {
    flag  = 0
    tag   = "issuewild"
    value = "amazonaws.com"
  }
}

# resource "cloudflare_record" "certificate_record" {
#   for_each = {
#     for record in var.certificate_validation_records :
#     record.name => record
#   }

#   zone_id = data.cloudflare_zone.periodic_table_zone.zone_id
#   name    = each.value.name
#   value   = each.value.value
#   type    = "CNAME"
#   ttl     = 300
# }