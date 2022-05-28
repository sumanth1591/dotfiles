set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.emacs.d/bin /usr/local/go/bin $HOME/.cargo/bin $fish_user_paths
#set PATH $PATH:$HOME/.local/bin:$HOME/.emacs.d/bin
set EDITOR "nvim"
set DOTFILES "$HOME/Documents/dotfiles"
set --universal FZF_DEFAULT_COMMAND 'fd'



set fish_greeting
fish_default_key_bindings #supress vim
# '⋊> '

###### SET MANPAGER ##########
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

# if status is-interactive
#  if [ (math (random)'%2') -eq 1 ]
#    ~/Documents/scripts/pipes/pipes.sh
#  else
#    ~/Documents/scripts/pipes/pipesX.sh
#  end
#end


if [ (math (random)'%2') -eq 1 ]
    colorscript -r
else
    $HOME/Documents/tmp_runes/rune -r
end

source ~/.config/fish/alias.fish
source ~/.config/fish/cust_functions.fish


#zoxide init fish | source
starship init fish | source
