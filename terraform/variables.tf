variable "hcloud_token" {
  sensitive = true
}

variable "hetzner_access_key" {
  sensitive = true
}
variable "hetzner_secret_key" {
  sensitive = true
}

# variable "servers" {
#   default = {
#     "master-1" = { type = "cx22", role = "master", subnet = "10.0.1.0/24" }
#     "master-2" = { type = "cx22", role = "master", subnet = "10.0.2.0/24" }
#     "master-3" = { type = "cx22", role = "master", subnet = "10.0.3.0/24" }
#     "worker-1" = { type = "cx22", role = "worker", subnet = "10.0.4.0/24" }
#     "worker-2" = { type = "cx22", role = "worker", subnet = "10.0.5.0/24" }
#     "worker-3" = { type = "cx22", role = "worker", subnet = "10.0.6.0/24" }
#   }
# }