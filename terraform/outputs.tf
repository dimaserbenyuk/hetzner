output "k3s_connect_command" {
  value = <<-EOT
    To connect to the K3s cluster, you can set the KUBECONFIG environment variable to the kubeconfig file:
    export KUBECONFIG=${path.module}/kubeconfig.yaml

    Or you can use kubectl directly by specifying the --kubeconfig flag:
    kubectl --kubeconfig=${path.module}/kubeconfig.yaml get nodes
  EOT
  description = "Command to connect to the K3s cluster."
}

output "network_id" {
  value = hcloud_network.k3s_network.id
}