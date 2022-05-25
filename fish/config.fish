set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.emacs.d/bin /usr/local/go/bin $HOME/.cargo/bin $fish_user_paths
#set PATH $PATH:$HOME/.local/bin:$HOME/.emacs.d/bin
set EDITOR "nvim"
set DOTFILES "$HOME/Documents/dotfiles"
# sudo systemctl enable display-manager.service



if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

#############END MANPAGER ###############



##########################custom functions########################
#######################prompt##################
# name: sashimi
function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -g red (set_color -o red)
  set -g blue (set_color -o blue)
  set -l green (set_color -o green)
  set -g normal (set_color normal)

  set -l ahead (_git_ahead)
  set -g whitespace ' '

  if test $last_status = 0
    set initial_indicator "$green◆"
    set status_indicator "$normal❯$cyan❯$green❯"
  else
    set initial_indicator "$red✖ $last_status"
    set status_indicator "$red❯$red❯$red❯"
  end
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]

    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($red$git_branch$normal)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($blue$git_branch$normal)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  # Notify if a command took more than 5 minutes
  if [ "$CMD_DURATION" -gt 300000 ]
    echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $initial_indicator $whitespace $cwd $git_info $whitespace $ahead $status_indicator $whitespace
end

function _git_ahead
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
  if [ $status != 0 ]
    return
  end
  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
  switch "$ahead $behind"
    case ''     # no upstream
    case '0 0'  # equal to upstream
      return
    case '* 0'  # ahead of upstream
      echo "$blue↑$normal_c$ahead$whitespace"
    case '0 *'  # behind upstream
      echo "$red↓$normal_c$behind$whitespace"
    case '*'    # diverged from upstream
      echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
  end
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end
#################end prompt##################
function spark --description Sparklines
    argparse --ignore-unknown --name=spark v/version h/help m/min= M/max= -- $argv || return

    if set --query _flag_version[1]
        echo "spark, version 1.1.0"
    else if set --query _flag_help[1]
        echo "Usage: spark <numbers ...>"
        echo "       stdin | spark"
        echo "Options:"
        echo "       --min=<number>   Minimum range"
        echo "       --max=<number>   Maximum range"
        echo "       -v or --version  Print version"
        echo "       -h or --help     Print this help message"
        echo "Examples:"
        echo "       spark 1 1 2 5 14 42"
        echo "       seq 64 | sort --random-sort | spark"
    else if set --query argv[1]
        printf "%s\n" $argv | spark --min="$_flag_min" --max="$_flag_max"
    else
        command awk -v min="$_flag_min" -v max="$_flag_max" '
            {
                m = min == "" ? m == "" ? $0 : m > $0 ? $0 : m : min
                M = max == "" ? M == "" ? $0 : M < $0 ? $0 : M : max
                nums[NR] = $0
            }
            END {
                n = split("▁ ▂ ▃ ▄ ▅ ▆ ▇ █", sparks, " ") - 1
                while (++i <= NR) 
                    printf("%s", sparks[(M == m) ? 3 : sprintf("%.f", (1 + (nums[i] - m) * n / (M - m)))])
            }
        ' && echo
    end
end
#############
# Spark functions
function letters
    cat $argv | awk -vFS='' '{for(i=1;i<=NF;i++){ if($i~/[a-zA-Z]/) { w[tolower($i)]++} } }END{for(i in w) print i,w[i]}' | sort | cut -c 3- | spark | ccat
    printf  '%s\n' 'abcdefghijklmnopqrstuvwxyz'  ' ' | ccat
end
###############
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end
############
function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
##############
bind ! __history_previous_command
bind '$' __history_previous_command_arguments
############

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
#function fish_user_key_bindings
#fish_default_key_bindings
#   fish_vi_key_bindings
#end
### END OF VI MODE ###

function evil
  switch $argv[1]
    case 1 
      fish_vi_key_bindings
    case 0
      fish_default_key_bindings
  end
end

function makebak
  cp $argv[1] $argv[1].bak
end

function avail
  command -v $1 > /dev/null
end

function test_letters
  switch $argv[1]
    case "i"
      set is_instant 1
    case "*"
      set is_instant 0
  end
  set nums "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" 
  set alps "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" 
  set punct "!" "@" "#" "\$" "%" "^" "&" "*" "(" ")" "{" "}"
  set ligatures "--" "---" "==" "===" "!=" "!==" "=!=" "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!" "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>" "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<\$>" "<\$" "\$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--" "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>" "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|" "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~" "~@" "[||]" "|]" "[|" "|}" "{|" "[< >]" "|>" "<|" "||>" "<||" "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::=" ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__"
  set confusions "iLloO0"
  echo \n
  echo -n "numbers: "
    for i in $nums
      echo -ne "$i "
        if test $is_instant -eq 1 
          sleep .2
        end
  end
  echo \n
  echo -n "letters: "
    for i in $alps
      echo -ne "$i "
      if test $is_instant -eq 1 
        sleep .2
      end
  end
  echo \n
  echo -n "symbols: "
    for i in $punct
      echo -ne "$i "
      if test $is_instant -eq 1
        sleep .2
      end
    end
  echo \n
  echo -n "ligatures: "
    for i in $ligatures
      echo -ne "$i "
      if test $is_instant -eq 1
        sleep .2
      end
    end
  echo \n
  echo -n "commonly confused: "
  echo -ne "$confusions"
  switch $argv[2]
    case "unicode"
      curl https://www.cl.cam.ac.uk/~mgk25/ucs/Postscript.txt
  end
end
###############################end functions#####################

# ~/Documents/pipes.sh


if [ (math (random)'%2') -eq 1 ]
    colorscript -r
else
    $HOME/Documents/tmp_runes/rune -r
end


#alias
alias jupyter_nb="jupyter notebook --no-browser"
alias ccat="lolcat"
alias cls="clear"
alias save="source ~/.config/fish/config.fish"
alias pbpaste="xsel -ob"
alias pbclear="xsel -cb"
alias pbcopy="xsel -ib"
alias copydirpath="pwd | xsel -ib"
alias fishconfig="$EDITOR ~/.config/fish/config.fish"
#alias update_soft="sudo dnf update -y && sudo dnf upgrade -y"
alias alacconfig="$EDITOR ~/.config/alacritty/alacritty.yml"
alias please="sudo"
alias e="dolphin"
# alias update_ship="curl -sS https://starship.rs/install.sh | sh"
alias starship_config="$EDITOR ~/.config/starship.toml"
alias ls="exa -la -F --icons -h --color=always -G"
alias lst="exa -la -F --icons -h --color=always -T"
alias ping="gping"
alias du="dust"
alias kittyconfig="$EDITOR ~/.config/kitty/kitty.conf"
alias diff_files="kitty +kitten diff"
alias icat="kitty +kitten icat"
alias cd..="cd .."
alias rec="asciinema rec" #specify a file name
alias play="asciinema play"
alias logout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
alias dir="dir --color"
alias vdir="vdir --color"
alias mexec="chmod +x"
#==================================pacman=========================================#
alias S="sudo pacman -S"
alias Sy="sudo pacman -Sy"
alias Syy="sudo pacman -Syy"
alias Ss="pacman -Ss"
alias Q="pacman -Q"
alias Qe="pacman -Qe" #installed by me
alias Qn="pacman -Qn" #installed from main repo
alias Qm="pacman -Qm" #installed from AUR
alias Qdt="pacman -Qdt" #un-needed dependencies
alias Qs="pacman -Qs" #search local
alias Rs="sudo pacman -Rs" #remove dependencies as well
alias Rsn="sudo pacman -Rsn" #remove config files too
alias Syu="sudo pacman -Syu"
alias Syyu="sudo pacman -Syyu"
alias Sql="pacman -Sql" #packages installed from specific repo
alias pacman_conf="sudo nvim /etc/pacman.conf"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
#================================================================================#
#zoxide init fish | source
starship init fish | source
