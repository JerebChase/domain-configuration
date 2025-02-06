output "dev_cert_domain" {
  description = "The domain to use for the dev cert"
  value       = "*.dev.${data.cloudflare_zone.main_zone.name}"
}