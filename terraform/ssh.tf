
resource "hcloud_ssh_key" "default" {
  name      = "default-ssh-key"
  public_key = file("~/.ssh/hetzner.pub")
}