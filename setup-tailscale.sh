#!/bin/bash

set -e

echo "=== Instalando Tailscale ==="

curl -fsSL https://tailscale.com/install.sh | sh

sudo systemctl enable --now tailscaled

echo ""
echo "Tailscale instalado."
echo "Agora execute:"
echo ""
echo "sudo tailscale up"
echo ""
echo "Depois confira o IP com:"
echo ""
echo "tailscale ip"
