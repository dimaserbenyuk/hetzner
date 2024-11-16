# hetzner

hetzner


1. Setup token

```shell
export TF_VAR_hcloud_token="....."
```

ssh-keygen -t rsa -b 4096 -f ~/.ssh/hetzner


scp -i ~/.ssh/hetzner cluster@ip-master:/etc/rancher/k3s/k3s.yaml  ${HOME}/.kube/k3s.yaml

export REMOTE_SERVER=ip......

sed -i '' 's/127.0.0.1/'$REMOTE_SERVER'/g' ./kubeconfig.yaml


export KUBECONFIG=${HOME}/.kube/k3s.yaml
chmod 600 ~/.kube/k3s.yaml


kubectl create secret generic hcloud \
  --from-literal=token=.... \
  --namespace=kube-system

kubectl create secret generic hcloud \
  --from-literal=token=p4wQK69Qm1f9oxBXHHqIA9ngqESHNjE5UgUV7jC2DDEQHYejSPHMPomcHui8P664 \
  --from-literal=robot-user=root \
  --from-literal=robot-password=root \
  --from-literal=network="10.0.0.0/16" \
  --namespace=kube-system

sudo ip link delete flannel.1

ip link