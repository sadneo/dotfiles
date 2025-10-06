set user $USER
function home-manager
    command home-manager --flake ~/.config/home-manager#$user $argv
end
