# hetzner

hetzner


1. Setup token

```shell
export TF_VAR_hcloud_token="....."
```

2. ssh-keygen
```shell
ssh-keygen -t rsa -b 4096 -f ~/.ssh/hetzner
```

3. tree

```shell
➜  terraform git:(main) tree           
.
├── cloud-init-master.yaml
├── cloud-init-worker.yaml
├── firewall.tf
├── lb.tf
├── network.tf
├── outputs.tf
├── providers.tf
├── servers.tf
├── ssh.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf

1 directory, 12 files
```


4. terraform plan

```shell
➜  terraform git:(main) terraform plan 
hcloud_network.k3s_network: Refreshing state... [id=10358840]
hcloud_ssh_key.default: Refreshing state... [id=24621540]
hcloud_firewall.allow_api_server: Refreshing state... [id=1740579]
hcloud_firewall.allow_ssh_http: Refreshing state... [id=1740568]
hcloud_network_subnet.private_subnets["10.0.2.0/24"]: Refreshing state... [id=10358840-10.0.2.0/24]
hcloud_network_subnet.private_subnets["10.0.3.0/24"]: Refreshing state... [id=10358840-10.0.3.0/24]
hcloud_network_subnet.public_subnets["10.0.5.0/24"]: Refreshing state... [id=10358840-10.0.5.0/24]
hcloud_network_subnet.public_subnets["10.0.6.0/24"]: Refreshing state... [id=10358840-10.0.6.0/24]
hcloud_network_subnet.public_subnets["10.0.4.0/24"]: Refreshing state... [id=10358840-10.0.4.0/24]
hcloud_network_subnet.private_subnets["10.0.1.0/24"]: Refreshing state... [id=10358840-10.0.1.0/24]
```


5. terraform apply
```shell

Apply complete! Resources: 0 added, 7 changed, 0 destroyed.

Outputs:

k3s_connect_command = <<EOT
To connect to the K3s cluster, you can set the KUBECONFIG environment variable to the kubeconfig file:
export KUBECONFIG=./kubeconfig.yaml

Or you can use kubectl directly by specifying the --kubeconfig flag:
kubectl --kubeconfig=./kubeconfig.yaml get nodes

EOT
network_id = "10358840"
```


```shell
scp -i ~/.ssh/hetzner cluster@ip-master:/etc/rancher/k3s/k3s.yaml  ${HOME}/.kube/k3s.yaml
```


```shell
export REMOTE_SERVER=ip......
```

```shell
sed -i '' 's/127.0.0.1/'$REMOTE_SERVER'/g' ./kubeconfig.yaml
```

```shell
export KUBECONFIG=${HOME}/.kube/k3s.yaml
chmod 600 ~/.kube/k3s.yaml
```

```shell
➜  hetzner git:(main) kubectl get nodes -o wide          
NAME            STATUS   ROLES                  AGE     VERSION        INTERNAL-IP       EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
master1         Ready    control-plane,master   4h7m    v1.30.6+k3s1   78...163     <none>        Ubuntu 24.04.1 LTS   6.8.0-48-generic   containerd://1.7.22-k3s1
worker-node-0   Ready    <none>                 3h54m   v1.30.6+k3s1   142....185   <none>        Ubuntu 24.04.1 LTS   6.8.0-48-generic   containerd://1.7.22-k3s1
worker-node-1   Ready    <none>                 3h54m   v1.30.6+k3s1   49..16       <none>        Ubuntu 24.04.1 LTS   6.8.0-45-generic   containerd://1.7.22-k3s1
worker-node-2   Ready    <none>                 3h54m   v1.30.6+k3s1   138....48    <none>        Ubuntu 24.04.1 LTS   6.8.0-45-generic   containerd://1.7.22-k3s1
worker-node-3   Ready    <none>                 3h54m   v1.30.6+k3s1   23...147     <none>        Ubuntu 24.04.1 LTS   6.8.0-48-generic   containerd://1.7.22-k3s1
worker-node-4   Ready    <none>                 3h54m   v1.30.6+k3s1   91....25     <none>        Ubuntu 24.04.1 LTS   6.8.0-45-generic   containerd://1.7.22-k3s1
```

```shell
kubectl create secret generic hcloud \
  --from-literal=token=.... \
  --namespace=kube-system


sudo ip link delete flannel.1

ip link
```

# install
```helm
helm install argo-cd ./argo-cd --values argo-cd/my-values.yaml
```