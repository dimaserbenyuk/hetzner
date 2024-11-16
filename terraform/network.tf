resource "hcloud_network" "k3s_network" {
  name     = "k3s-network"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "private_subnets" {
  for_each = toset(["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]) 
  network_id   = hcloud_network.k3s_network.id
  type         = "cloud"
  network_zone = "eu-central" 
  ip_range     = each.key
}


resource "hcloud_network_subnet" "public_subnets" {
  for_each = toset(["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]) 
  network_id   = hcloud_network.k3s_network.id
  type         = "cloud"
  network_zone = "eu-central" 
  ip_range     = each.key
}
