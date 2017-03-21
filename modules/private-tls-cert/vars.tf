# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "ca_cert_public_key_file_path" {
  description = "Write the PEM-encoded CA certificate public key to this path (e.g. /etc/tls/ca.crt.pem)."
}

variable "ca_cert_private_key_file_path" {
  description = "Write the PEM-encoded CA certificate private key to this path (e.g. /etc/tls/ca.key.pem)."
}

variable "cert_public_key_file_path" {
  description = "Write the PEM-encoded certificate public key to this path (e.g. /etc/tls/vault.crt.pem)."
}

variable "cert_private_key_file_path" {
  description = "Write the PEM-encoded certificate private key to this path (e.g. /etc/tls/vault.key.pem)."
}

variable "cert_owner" {
  description = "The OS user who should be given ownership over the certificate files."
}

variable "organization_name" {
  description = "The name of the organization to associate with the certificates (e.g. Acme Co)."
}

variable "ca_common_name" {
  description = "The common name to use in the subject of the CA certificate (e.g. acme.co CA cert)."
}

variable "cert_common_name" {
  description = "The common name to use in the subject of the certificate (e.g. acme.co cert)."
}

variable "dns_names" {
  description = "List of DNS names for which the certificate will be valid (e.g. vault.service.consul, foo.example.com)."
  type = "list"
}

variable "ip_addresses" {
  description = "List of IP addresses for which the certificate will be valid (e.g. 127.0.0.1)."
  type = "list"
}

variable "validity_period_hours" {
  description = "The number of hours after initial issuing that the certificate and CA certificate will become invalid."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ca_cert_allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the issued CA certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type = "list"
  default = [
    "cert_signing",
    "digital_signature",
    "server_auth",
    "client_auth",
    "key_encipherment"
  ]
}

variable "cert_allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the issued certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type = "list"
  default = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth"
  ]
}

variable "cert_permissions" {
  description = "The Unix file permission to assign to the cert files (e.g. 0600)."
  default = "0600"
}

variable "private_key_algorithm" {
  description = "The name of the algorithm to use for private keys. Must be one of: RSA or ECDSA."
  default = "ECDSA"
}