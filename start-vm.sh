#!/bin/bash

VM_NAME="Windows10-Gaming"
RAM="32G"
CPU="8"

qemu-system-x86_64 \
  -enable-kvm \
  -machine q35 \
  -cpu host \
  -smp "$CPU" \
  -m "$RAM" \
  -drive file="windows10.qcow2",format=qcow2 \
  -boot menu=on \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0 \
  -device virtio-rng-pci
