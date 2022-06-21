set EDITOR "nvim"
alias vim="nvim"
alias jupyter_nb="jupyter notebook --no-browser"
alias ccat="lolcat"
alias hx="helix"
alias cls="clear"
alias save="source ~/.config/fish/config.fish"
alias pbpaste="xsel -ob"
alias pbclear="xsel -cb"
alias pbcopy="xsel -ib"
alias copydirpath="pwd | xsel -ib"
alias fishconfig="$EDITOR ~/.config/fish/config.fish"
alias fishalias="$EDITOR ~/.config/fish/alias.fish"
alias fishfnc="$EDITOR ~/.config/fish/cust_functions.fish"
#alias update_soft="sudo dnf update -y && sudo dnf upgrade -y"
alias alacconfig="$EDITOR ~/.config/alacritty/alacritty.yml"
alias please="sudo"
alias e="dolphin"
# alias update_ship="curl -sS https://starship.rs/install.sh | sh"
alias starship_config="$EDITOR ~/.config/starship.toml"
alias ls="exa -la -F --icons -h --color=always --git -G"
alias lst="exa -la -F --icons -h --color=always --git -T"
alias ping="gping"
alias du="dust"
alias df="duf"
alias ps="procs"
alias btm="btm --color nord --battery"
alias kittyconfig="$EDITOR ~/.config/kitty/kitty.conf"
alias icat="kitty +kitten icat"
alias cd..="cd .."
alias rec="asciinema rec" #specify a file name
alias play="asciinema play"
alias logout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
alias dir="dir --color"
alias vdir="vdir --color"
alias mexec="chmod +x"
alias cat="bat"
#==================================pacman && paru=========================================#
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
alias pS="paru"
alias pSs="paru -Ss"
#===========================================================================================#




