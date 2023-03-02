#!/bin/bash

# Atualizando repo
apt update -y

# Baixando versão mais recente kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Validando o binario
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# Validando o binario de soma de verificação kubectl
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Instalando o kubectk
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Caso voce não tenha acesso ao root, ainda podera instalar o kubectl no ~/.local/bin diretorio:
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

# Verificando versão
kubectl version --client --output=yaml    
