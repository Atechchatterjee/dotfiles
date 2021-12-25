# Path to Oh My Fish install.
set -x SHELL /bin/bash
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

fish_vi_key_bindings

# fish_vi_cursor

set -U budspencer_nobell

# removes the fish greeting prompt
set fish_greeting

set theme_color_scheme "nord"

xset r rate 250 100

set EDITOR "nvim"
set VISUAL "nvim"
setxkbmap -option "caps:escape"
# nvm use 16.13.1

abbr h "cd ~"
abbr sz "source ~/.zshrc"
abbr ov "nvim ~/.vimrc"
abbr of "nvim ~/dotfiles/omf.fish"
abbr sf "source ~/dotfiles/omf.fish"
abbr systop "systemctl stop docker mysql mongodb apache2"
abbr weather "curl wttr.in"
abbr tmuxComp "tmux attach-session -t competitive-coding"
abbr swallpaper "nitrogen --restore &"
abbr muteToggle "amixer -q -D pulse set Master toggle"
abbr show_wifi "nmcli d wifi list"
abbr clock "tty-clock -c -C 1 -b -s -S"
abbr at "alacritty-theme-switch"
abbr alc "nvim ~/.config/alacritty/alacritty.yml"
abbr qt "nvim ~/.config/qtile/config.py"
abbr ra "ranger"
abbr p "pwd"
abbr ss "systemctl suspend"
abbr in "nvim ~/.config/nvim/init.vim"
abbr ns "npm start"
abbr pys "python manage.py runserver"
abbr sys "systemctl"
abbr change_default_browser "sudo update-alternatives --config x-www-browser"
abbr db "sudo psql"
abbr omf.fish "nvim ~/.config/fish/conf.d/omf.fish"
abbr kitty.conf "nvim ~/.config/kitty/kitty.conf"
abbr reload "source ~/.config/fish/conf.d/omf.fish"
abbr nvimconf "nvim ~/.config/nvim/init.vim"
abbr rc "nvim ~/.config/awesome"

alias ls 'exa -al --color=always --group-directories-first' 
alias la 'exa -a --color=always --group-directories-first' 
alias ll 'exa -l --color=always --group-directories-first'  
alias lt 'exa -aT --color=always --group-directories-first' 
alias cp "cp -i"
alias tmux "tmux -u"
alias yarn "yarnpkg"
alias ... "cd ../../"
alias .... "cd ../../../"
alias config '/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'

function grun
	g++ -std=c++17 $argv.cpp -o $argv && ./$argv 
end

function ccp
	cp ~/coding/Cpp/template.cpp ./$argv.cpp
end

function jrun
	javac $argv.java && java $argv
end

function gccrun
	gcc $argv.c -o $argv && ./$argv
end

function create_react_app
	npx create-react-app $argv --template typescript	
end

function stop_port
	kill -9 (sudo lsof -t -i:$argv)
end

function startpy
	systemctl start postgresql
	source ./backend/venv/bin/activate.fish 
	python ./backend/src/manage.py runserver
end

function connect_wifi
	nmcli d wifi connect $argv
end

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
