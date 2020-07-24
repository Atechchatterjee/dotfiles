# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

fish_vi_key_bindings

abbr sz "source ~/.zshrc"
abbr h "cd ~"
abbr systop "systemctl stop docker mysql mongodb apache2"
abbr weather "curl wttr.in"
abbr tmuxComp "tmux attach-session -t competitive-coding"
abbr tt "tmux -u"
abbr sw "nitrogen --restore &"
abbr muteToggle "amixer -q -D pulse set Master toggle"
abbr showWifi "nmcli d wifi list"
abbr clock "tty-clock -c -C 1 -b -s -S"
abbr at "alacritty-theme-switch"
abbr alc "nvim ~/.config/alacritty/alacritty.yml"
abbr qt "nvim ~/.config/qtile/config.py"
abbr ra "ranger"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
