# ~/.bashrc

# SYSTEM & GLOBAL SOURCING
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# ENVIRONMENT & PATH VARIABLES
# Base User Binaries
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

# System Default Programs
export VISUAL='nvim'
export EDITOR='nvim'
export BROWSER='brave'

# Terminal History Settings
export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend

# Themes
export GTK_THEME="Graphite-blue-Dark:dark"

# SHELL SETTINGS & PROMPT
set -o vi  
PS1="\[\e[1;38;2;50;130;224m\]❱❱\w\[\e[0m\]$ "
if [ -z "$NVIM" ]; then
    fastfetch
fi

# 4. ALIASES
alias q="exit"
alias df="cd .."
alias sbshrc='source ~/.bashrc'
alias inbshrc='tee -a ~/.bashrc'
alias vbshrc='vim ~/.bashrc'
alias nvbshrc='nvim ~/.bashrc'
alias rfsh="clear && printf '\e[3J' && sbshrc"
alias clear="clear && printf '\e[3J'"
alias icat='kitty +kitten icat'
alias lsimg='timg --grid=7 --title="%b" *.jpg *.png 2> /dev/null'
alias wlcp='wl-copy'
alias nivm="nvim"
alias reboot='loginctl reboot'
alias poweroff='loginctl poweroff'
alias npxsrvr="npx live-server --no-browser --port=8080"
alias esp=". $HOME/export-esp.sh"
alias dohayras="ollama serve"
alias dracarys="ollama run llama3.1"
alias lykiri="ollama stop llama3.1"
alias strm='SINK=$(pactl get-default-sink) && pactl load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=${SINK}.monitor record=true port=8000 listen=0.0.0.0'
alias stpstrm='pactl unload-module module-simple-protocol-tcp'

# Dotfiles & Config Navigation 
alias dots='cd ~/dotfiles'
alias conf='cd ~/dotfiles/.config/'
alias confd='cd ~/dotfiles/.config/dunst'
alias confe='cd ~/dotfiles/.config/eww'
alias confh='cd ~/dotfiles/.config/hypr'
alias confnd='cd ~/dotfiles/.config/nwg-dock-hyprland'
alias confr='cd ~/dotfiles/.config/rofi'
alias confw='cd ~/dotfiles/.config/waybar'
alias confa='cd ~/dotfiles/.config/alacritty'
alias conff='cd ~/dotfiles/.config/fastfetch'
alias confk='cd ~/dotfiles/.config/kitty'
alias confnv='cd ~/dotfiles/.config/nvim'

# Hyprland & Ricing Utilities 
alias rwybr='pkill waybar &> /dev/null; (waybar &> /dev/null &)'
alias rdock='killall nwg-dock-hyprland &> /dev/null; (nwg-dock-hyprland -d -i 30 -hd 0 &> /dev/null &)'
alias rhppr='pkill hyprpaper; hyprpaper &> /dev/null &'

# Git Workflow 
alias gl='git log'
alias ga='git add .'
alias gc='git commit -m'
alias gpsh='git push origin main'

# Applications
alias whatsapp="gtk-launch brave-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop"
alias gemini="gtk-launch brave-gdfaincndogidkdcdkhapmbffkckdkhn-Default.desktop"
alias krita="QT_QPA_PLATFORM=wayland krita"

# Running programs
rst(){
	rustc "$1" -o out && ./out ; rm -f out
}
cpp(){
	g++ "$1" -o out && ./out ; rm -f out
}
sanp(){
	python3 "$@"
}
fd(){
  thing=$1
  if test -d "$thing"; then
    cd "$thing"
  elif test -z "$thing"; then
    cd "$HOME"   
  else
    nvim "$thing"
  fi
}
