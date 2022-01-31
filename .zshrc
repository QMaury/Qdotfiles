# octo's config stolen from Luke Smith :)

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[red]%}%n%{$fg[red]%}@%{$fg[orange]%}%M %{$fg[orange]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# alias
alias dirpas="cd ~/school/cle/passion"
alias discord="discord --no-sandbox"
alias dirspanish="cd ~/school/spanish"
alias ls="lsd -l"
alias mm8="cd ~/.wine/drive_c/Program\ Files\ \(x86\)/GOG.com/Might\ and\ Magic\ VIII/ ; wine MM8Setup.exe"
alias dirchs="cd ~/code/C/chinkShit"
alias direvo="cd ~/code/C/evo"
alias diradv3="cd ~/code/C/qadv3"
alias fixRes="xrandr --output eDP1 --mode 1366x768"
alias dirbook="cd ~/Documents/books/"
alias dirmeu="cd ~/code/html/meulinex"
alias wttr="curl wttr.in"
alias dirjou="cd ~/.local/share/journal/22"
alias xclippy='xclip -selection clipboard'
alias fantaC='cd ~/code/C/highFantasy'
alias dircurse='cd ~/code/C/nCurses'
alias ytdl="youtube-dl"
alias mingwcc="x86_64-w64-mingw32-cc"
alias news="newsboat"
alias n="nvim"
alias dirsoc="cd ~/school/socials"
alias dirspa="cd ~/school/spanish"
alias Vim="vim"
alias diradv="cd ~/code/C/adventureproj"
alias v="vim"
alias symbols=" ~/Documents/miscSymbols"
alias s="sxiv"
alias c="cat" 
alias diradv2="cd ~/code/C/QAdventure2"
alias mail="xdg-open https://mail.google.com/mail/u/0/h"
alias clock="date "+%T""
alias dircle="cd ~/school/cle"
alias dirsci="cd ~/school/science\ bitch/science10"

#zork
	alias zork1="frotz ~/.local/share/zork/zork1/DATA/ZORK1.DAT"
	alias zork2="frotz ~/.local/share/zork/zork2/DATA/ZORK2.DAT"
	alias zork3="frotz ~/.local/share/zork/zork3/DATA/ZORK3.DAT"
alias dirsch="cd ~/school"
alias dirpia="cd /opt/piavpn/bin"
alias displayfix="xrandr --output eDP1 --primary --right-of HDMI1"
alias dircode="cd ~/code"
alias vimrc="$EDITOR ~/.vimrc"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias batterystat="upower -d | grep percent"
alias dirgit="cd ~/git"
alias dirc="cd ~/code/C"
alias dirpos="cd ~/code/posix"
alias dirpy="cd ~/code/python"
alias dirC="cd ~/code/C"
alias dirqsite="cd ~/code/qmaurysite"
alias zshrc="$EDITOR ~/.zshrc"
alias dirsocials="cd ~/school/socials"
alias q="exit"
alias :q="exit"
alias schedule="cat ~/school/schedule-semester1.txt"
alias sch="cat ~/school/schedule-semester1.txt"
alias i3conf="$EDITOR ~/.config/i3/config"

# Basic auto/tab complete:
autoload -Uz compinit
compinit
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^a' 'bc -lq\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

# Default shit
export EDITOR='nvim'
