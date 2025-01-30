#!/bin/bash


qemu-system-aarch64 \
    -M virt \
    -cpu cortex-a53 \
    -nographic \
    -kernel buildroot/output/images/Image \
    -append "console=ttyAMA0 root=/dev/vda rw" \
    -drive file=buildroot/output/images/rootfs.ext4,if=virtio,format=raw
