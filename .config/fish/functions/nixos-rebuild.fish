set host (cat /etc/hostname)
function nixos-rebuild
    command nixos-rebuild --flake /etc/nixos#$host $argv
end
