variable "dev_cert_domain" {
  description = "The domain for the dev cert"
  type        = string
}

variable "prod_cert_domain" {
  description = "The domain for the prod cert"
  type        = string
}

variable "zone_id" {
  description = "The id of the cloudflare zone"
  type        = string
}