#!/bin/bash

set -e

echo "=== Instalando QEMU/KVM ==="

sudo apt update

sudo apt install -y \
    qemu-kvm \
    qemu-system-x86 \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virt-manager \
    ovmf \
    swtpm

sudo systemctl enable --now libvirtd

sudo usermod -aG libvirt "$USER"
sudo usermod -aG kvm "$USER"

echo ""
echo "================================"
echo " QEMU/KVM instalado com sucesso"
echo "================================"
echo ""
echo "Reinicie a máquina antes de continuar."
