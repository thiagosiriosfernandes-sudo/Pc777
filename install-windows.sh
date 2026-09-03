#!/bin/bash

set -e

ISO="Win10.iso"
DISK="windows10.qcow2"

if [ ! -f "$ISO" ]; then
    echo "ERRO: $ISO não foi encontrada."
    echo "Coloque a ISO do Windows 10 na máquina que executará a VM."
    exit 1
fi

if [ ! -f "$DISK" ]; then
    echo "ERRO: $DISK não foi encontrado."
    echo "Execute create-disk.sh primeiro."
    exit 1
fi

echo "=== Iniciando instalação do Windows 10 ==="

qemu-system-x86_64 \
    -enable-kvm \
    -machine q35 \
    -cpu host \
    -smp 8 \
    -m 32G \
    -drive file="$DISK",format=qcow2 \
    -cdrom "$ISO" \
    -boot d \
    -device virtio-net-pci,netdev=net0 \
    -netdev user,id=net0 \
    -device virtio-rng-pci
