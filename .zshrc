#echo "\n"
#echo -e "\e[1;44m     " "\e[1;41m     ""\e[1;42m     " "\e[1;47m     "

#echo "\n"
export ZSH="/home/anish/.oh-my-zsh"

ZSH_THEME="gianu"

plugins=(git zsh-abbr)

source $ZSH/oh-my-zsh.sh

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# source ${0:A:h}/zsh-autosuggestions.zsh
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
	 [[ $1 = 'block' ]]; then
	echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
	   [[ ${KEYMAP} == viins ]] ||
	   [[ ${KEYMAP} = '' ]] ||
	   [[ $1 = 'beam' ]]; then
	echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

 ctrlz() {
  if [[ $#BUFFER == 0 ]]; then
	fg >/dev/null 2>&1 && zle redisplay
  else
	zle push-input
  fi
}
zle -N ctrlz
bindkey '^Z' ctrlz

# alias
alias sz="source ~/.zshrc"
alias h="cd ~"
alias systop="systemctl stop docker mysql mongodb apache2"
alias weather="curl wttr.in"
alias tmuxComp="tmux attach-session -t competitive-coding"
alias tt="tmux -u"
alias sw="nitrogen --restore &"
alias muteToggle="amixer -q -D pulse set Master toggle"
alias showWifi="nmcli d wifi list"
alias clock="tty-clock -c -C 1 -b -s -S"
alias at="alacritty-theme-switch"
alias qt="nvim ~/.config/qtile/config.py"
alias ra="ranger"


jrun() { javac $1.java && java $1 ; }
cpTemp() { cp ~/coding/Cpp/template.cpp ./$1.cpp; }
cppTemp() { cp ~/coding/Cpp/template.cpp ./$1.cpp && vim ./$1.cpp }
grun() { g++ -std=c++17 $1.cpp -o $1 && ./$1 }
vp() { amixer -q -D pulse set Master $1%+ }
vd() { amixer -q -D pulse set Master $1%- }

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

xset r rate 300 100

export VISUAL="nvim";
export EDITOR="nvim";

source /home/anish/.config/broot/launcher/bash/br
