#!/bin/bash

#Usar esse pra gerar um build do qemu, depois de buildado, executar o script ./runqemu.sh
DEFAULT_DEFCONFIG_NAME="qemu_aarch64_virt_defconfig" #defconfig fornecido pelo buildroot
CUSTOM_DEFCONFIG_NAME="custom_qemu_defconfig" #defconfig externo customizado

#Usar esse para gerar uma imagem pra raspberry 4
#DEFAULT_DEFCONFIG_NAME="raspberrypi4_64_defconfig"  #defconfig fornecido pelo buildroot
#CUSTOM_DEFCONFIG_NAME="custom_raspberrypi_defconfig" #defconfig externo customizado