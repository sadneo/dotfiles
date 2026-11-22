#!/bin/sh
readlink /run/current-system | sed -E "s|^/nix/store/[^-]+-nixos-system-$(hostname)-||; s|-?[0-9]+\.[0-9]+\..*$||"
