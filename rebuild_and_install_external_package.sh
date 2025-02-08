#!/bin/bash
# Rebuild external packages and reinstall into the final build image

cd buildroot

make morning-dirclean
make morning-rebuild
make afternoon-dirclean
make afternoon-rebuild
make night-dirclean
make night-rebuild
make