#!/bin/bash

set -e

DISK="windows10.qcow2"
SIZE="100G"

echo "=== Criando disco virtual do Windows 10 ==="

if [ -f "$DISK" ]; then
    echo "O disco $DISK já existe."
    exit 0
fi

qemu-img create -f qcow2 "$DISK" "$SIZE"

echo ""
echo "Disco criado:"
echo "$DISK"
echo "Tamanho máximo: $SIZE"
