#!/bin/bash
# Rebuild external packages and reinstall into the final build image
# This will rebuild and install all external package bellow, even if not selected in menuconfig

cd buildroot

make morning-dirclean
make morning-rebuild
make afternoon-dirclean
make afternoon-rebuild
make night-dirclean
make night-rebuild
make simple_stream_server-dirclean
make simple_stream_server-rebuild
make
