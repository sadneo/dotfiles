if status is-interactive
  set fish_greeting
end

function fish_command_not_found
    echo "Command not found: $argv"
end
