#!/usr/bin/env sh
if [ -x /usr/bin/gh ]; then
    exec /usr/bin/gh auth git-credential "$@"
elif [ -x /home/aidan/.nix-profile/bin/gh ]; then
    exec /home/aidan/.nix-profile/bin/gh auth git-credential "$@"
else
    exit 1
fi
