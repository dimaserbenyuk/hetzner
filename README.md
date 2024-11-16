# hetzner

hetzner


1. Setup token

```shell
export TF_VAR_hcloud_token="....."
```

ssh-keygen -t rsa -b 4096 -f ~/.ssh/hetzner


scp -i ~/.ssh/hetzner cluster@ip-master:/etc/rancher/k3s/k3s.yaml ./kube/k3s.yaml

export REMOTE_SERVER=ip......

sed -i '' 's/127.0.0.1/'$REMOTE_SERVER'/g' ./kubeconfig.yaml


export KUBECONFIG=${HOME}/.kube/k3s.yaml
chmod 600 ~/.kube/k3s.yaml