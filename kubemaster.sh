#!/bin/bash

# Alterando hostname
hostname kube-master
echo "kube-master" > /etc/hostname
bash

# Instalando docker
curl -fsSL https://get.docker.com | sh

# Adicionando repo/gpp key e instalando kubeadm, kubelet e kubectl
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Iniciando cluster kubernetes
kubeadm init
