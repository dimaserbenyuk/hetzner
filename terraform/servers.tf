resource "hcloud_server" "master-node" {
  name        = "master1"
  image       = "ubuntu-24.04"
  server_type = "cax11"
  location    = "fsn1"
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  network {
    network_id = hcloud_network.k3s_network.id
    ip         = "10.0.1.0/24"
  }

  user_data = file("${path.module}/cloud-init-master.yaml")

    # Attach both firewalls to the master node
  firewall_ids = [
    hcloud_firewall.allow_ssh_http.id,
    hcloud_firewall.allow_api_server.id
  ]
  depends_on = [hcloud_network_subnet.private_subnets]
}

resource "hcloud_server" "worker-nodes" {
  count = 5
  name        = "worker-node-${count.index}"
  image       = "ubuntu-24.04"
  server_type = "cax11"
  location    = "fsn1"
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  network {
    network_id = hcloud_network.k3s_network.id
  }
  user_data = file("${path.module}/cloud-init-worker.yaml")
  firewall_ids = [hcloud_firewall.allow_ssh_http.id]
  depends_on = [hcloud_network_subnet.private_subnets, hcloud_server.master-node]
}