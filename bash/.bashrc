# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

### ALIAS ### ---------------------------------------------------------
alias ba='nvim ~/.bashrc'
alias src='source ~/.bashrc'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias dot-x='cd ~/.dotfiles-wayland/ && ranger'
alias nvm='cd ~/.dotfiles-wayland/AeroNvim/.config/nvim/ && ranger'
alias hype='cd ~/.config/hypr/ && ranger'
alias elko='cd ~/.config/eww/ && ranger'

alias dot-w='cd ~/.dotfiles-xord/ && ranger'
alias bs='cd ~/.config/bspwm/' && ranger'
alias sx='cd ~/.config/sxhkd/' && ranger'
alias po='cd ~/.config/polybar/' && ranger'

# Helper for running C code without a makefile on the shell
# using Here documents feature.
# Example : 
# $ go_c << '---'
# $ ... code
# $ ---
# $ ./a.out
go_libs="-lm"
go_flags="-g -Wall -include ~/Projects/Coding/C/useful-headers/allheaders.h -O3"
alias go_c="c99 -xc - $go_libs $go_flags"

# Ranger workaround for keeping dir on exit
function ranger_func {
    ranger $*
    local quit_cd_wd_file="$HOME/.ranger_quit_cd_wd"
    if [ -s "$quit_cd_wd_file" ]; then
        cd "$(cat $quit_cd_wd_file)"
        true > "$quit_cd_wd_file"
    fi
}

alias rn='ranger_func'
alias coding='cd ~/Projects/Coding/ && rn'

### MISC ### -----------------------------------------------------------

# Color suport for less, man, etc.
export LESS="--RAW-CONTROL-CHARS"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

alias ha='nvim ~/Scripts/handy.sh'
source ~/Scripts/handy.sh
