# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# changes cursor in insert and normal mode
function fish_vi_cursor --on-variable fish_bind_mode
    switch $fish_bind_mode
        case insert
            printf '\e]50;CursorShape=1\x7'
        case default
            printf '\e]50;CursorShape=0\x7'
        case "*"
            printf '\e]50;CursorShape=0\x7'
    end
end

fish_vi_cursor
set fish_cursor_default line
set fish_cursor_insert line
set fish_cursor_visual block

# removes the fish greeting prompt
set fish_greeting

xset r rate 250 100

set EDITOR "nvim"
set VISUAL "nvim"

abbr sz "source ~/.zshrc"
abbr ov "nvim ~/.vimrc"
abbr of "nvim ~/dotfiles/omf.fish"
abbr sf "source ~/dotfiles/omf.fish"

abbr h "cd ~"
abbr systop "systemctl stop docker mysql mongodb apache2"
abbr weather "curl wttr.in"
abbr tmuxComp "tmux attach-session -t competitive-coding"
abbr tt "tmux -u"
abbr swallpaper "nitrogen --restore &"
abbr muteToggle "amixer -q -D pulse set Master toggle"
abbr showWifi "nmcli d wifi list"
abbr clock "tty-clock -c -C 1 -b -s -S"
abbr at "alacritty-theme-switch"
abbr alc "nvim ~/.config/alacritty/alacritty.yml"
abbr qt "nvim ~/.config/qtile/config.py"
abbr ra "ranger"
abbr p "pwd"
abbr ss "systemctl suspend"
abbr in "nvim ~/dotfiles/init.vim"
abbr ns "npm start"

alias l "ls -la"

function grun
	g++ -std=c++17 $argv.cpp -o $argv && ./$argv 
end

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
