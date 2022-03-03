# octo's config stolen from Luke Smith :)

autoload -U colors && colors	# Load colors
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

setopt prompt_subst

prompt='%B%{$fg[red]%}%0/ %{$fg[green]%}$(git_branch_name) %{$fg[white]%}$> '

stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# alias
alias dirwri="cd ~/work/writings"
alias cc="cc -Wextra"
alias discord="discord --no-sandbox"
alias ls="lsd -l"
alias cmatrix="cmatrix -s -u 6 -M GNUs_Not_UNIX"
alias diraylib="cd ~/work/code/C/raylib"
alias scim="sc-im"
alias dircomp="cd ~/school/composition"
alias rm="rm -i"
alias gitpushqadv="git push https://QMaury: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@github.com/QMaury/QAdventure3.git"
alias diradv3="cd ~/work/code/C/qadv3"
alias fixRes="xrandr --output eDP1 --mode 1366x768"
alias dirbook="cd ~/Documents/books/"
alias wttr="curl wttr.in"
alias dirjou="cd ~/.local/share/journal/22"
alias xclippy='xclip -selection clipboard'
alias mingwcc="x86_64-w64-mingw32-cc"
alias news="newsboat"
alias v="vim"
alias s="sxiv"

#zork
	alias zork1="frotz ~/.local/share/zork/zork1/DATA/ZORK1.DAT"
	alias zork2="frotz ~/.local/share/zork/zork2/DATA/ZORK2.DAT"
	alias zork3="frotz ~/.local/share/zork/zork3/DATA/ZORK3.DAT"
alias dirsch="cd ~/school"
alias dirpia="cd /opt/piavpn/bin"
alias displayfix="xrandr --output eDP1 --primary --right-of HDMI1"
alias dircode="cd ~/work/code"
alias vimrc="$EDITOR ~/.vimrc"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias batterystat="upower -d | grep percent"
alias dirgit="cd ~/git"
alias dirc="cd ~/work/code/C"
alias dirpos="cd ~/work/code/posix"
alias dirC="cd ~/work/code/C"
alias dirqsite="cd ~/work/code/qmaurysite"
alias zshrc="vim ~/.zshrc"
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
export EDITOR='vim'

