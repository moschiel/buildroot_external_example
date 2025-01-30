#!/bin/bash

# apartir da configuração atual em 'buildroot/.config', geramos um defconfig customizado externo

source variables.sh

cd buildroot
make savedefconfig BR2_EXTERNAL=../extern BR2_DEFCONFIG=../extern/configs/${CUSTOM_DEFCONFIG_NAME}