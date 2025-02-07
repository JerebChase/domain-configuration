output "dev_cert_domain" {
  description = "The domain to use for the dev cert"
  value       = "*.dev.${data.cloudflare_zone.main_zone.name}"
}

output "prod_cert_domain" {
  description = "The domain to use for the prod cert"
  value       = "*.${data.cloudflare_zone.main_zone.name}" 
}