import datetime
import os
import subprocess
import psutil
from libqtile import bar, hook, layout, widget 
from libqtile.config import Click, Drag, Group, Key, Screen, ScratchPad, DropDown, Key, Match
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# color palete
purple = "#783C96"
blue_bg = "#2bbac5"
white = "#ffffff"
black = "#0A0A0A"

onedarkBlue = "#3C909B"
onedarkRed = "#BE5046"

gruvboxRed = "#F94B3F"
gruvboxAqua = "#689D6A"
gruvboxBrown = "#1D2021"
gruvboxOrange = "#D65F34"
gruvboxBlue = "#458587"

nordRed = "#BF616A"
nordGreen = "#A3BE8C"
nordBlue = "#81A1C1"
nordDBlue = "#2D333E"
nordPurple = "#B48EAD"
deepBlue = "#292d3e"

draculaYellow = "#F1FA8C"
draculaRed = "#FF5555"
draculaGreen = "#50FA7B"

terminal = guess_terminal()

universal_fontsize = 12

# setting the background colors
topBar_bg = "#101219"
currentLayout_bg = topBar_bg
memory_bg = nordDBlue
net_bg = gruvboxBrown
time_bg =  nordDBlue
shutdown_bg = topBar_bg

groupBoxHighlight = onedarkRed

# setting the foregroung colors
memory_fg = white
net_fg = white
time_fg = white

def open_rofi(qtile):
    qtile.cmd_spawn('rofi -show drun -show-icons')

top_bar_config1 = [
                widget.TextBox(
                    text=' ',
                    background=nordDBlue,
                    foreground=white,
                    padding=8,
                    margin_y = 2,
                    fontsize=universal_fontsize + 2,
                    mouse_callbacks={'Button1': open_rofi},
                ),

                widget.GroupBox(
                    margin_y = 5,
                    padding = 3,
                    background=topBar_bg,
                    foreground=purple,
                    highlight_color=groupBoxHighlight,
                    highlight_method="line",
                    center_aligned=True,
                    # rounded=True,
                    fontsize=universal_fontsize+4,
                    this_current_screen_border = groupBoxHighlight
                ),

                widget.Sep(
                    background=topBar_bg,
                    foreground=topBar_bg,
                    padding=10,
                ),

                widget.WindowName(
                    background=topBar_bg,
                    foreground=white,
                    fontsize=11,
                ),

                widget.Sep(
                    background=topBar_bg,
                    foreground=topBar_bg,
                    padding=2,
                ),
                widget.Systray(
                    background=topBar_bg,
                    fontsize=universal_fontsize,
                    margin_y=20,
                    padding=2,
                ),

                widget.Sep(
                    background=topBar_bg,
                    foreground=topBar_bg,
                    padding=8
                ),
                widget.TextBox(
                    text=' ',
                    background=memory_bg,
                    foreground=onedarkRed,
                    padding=8,
                    fontsize=universal_fontsize + 3,
                ),

                widget.Volume(
                    background=memory_bg,
                    padding=8,
                    mute_command="amixer -q -D pulse set Master toggle",
                    volume_up_command="amixer -c 0 -q set Master 2dB+",
                    volume_down_command="amixer -c 0 -q set Master 2dB-",
                    fontsize=universal_fontsize,
                ),
                # widget.TextBox(
                    # text="",
                    # background=topBar_bg,
                    # foreground=net_bg,
                    # fontsize=universal_fontsize+47,
                    # padding=-12,
                # ),
                widget.CurrentLayout(
                    foreground="#ffffff",
                    background=net_bg,
                    fontsize=universal_fontsize,
                    padding=8
                ),
                # widget.TextBox(
                    # text="",
                    # background=net_bg,
                    # foreground=memory_bg,
                    # fontsize=universal_fontsize+47,
                    # padding=-12,
                # ),

               widget.TextBox(
                   text = 'memory :',
                   background = time_bg,
                   foreground = draculaYellow,
                   padding = 10,
                   fontsize = universal_fontsize
                ),

                widget.Memory(
                    background=memory_bg,
                    foreground=memory_fg,
                    padding=8,
                    mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
                        terminal + ' -e htop')},
                    fontsize=universal_fontsize,
                ),

                # widget.TextBox(
                    # text="",
                    # background=memory_bg,
                    # foreground=net_bg,
                    # fontsize=57,
                    # padding=-12
                # ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#1D96F9", "#ffff00"),
                    },
                    background=net_bg,
                    name_transform=lambda name: name.upper(),
                    fontsize=universal_fontsize,
                ),

                widget.TextBox(
                        text=" ",
                    background=net_bg,
                    foreground=nordGreen,
                    fontsize=universal_fontsize,
                    padding = 7
                ),
                widget.Battery(
                    format=' {percent:2.0%} ',
                    battery=0,
                    background=net_bg,
                    charge_char='<',
                    discharge_char='*',
                    low_percentage=0.2,
                    low_foreground=onedarkRed,
                    padding=10
                ),
                widget.Sep(
                    background=net_bg,
                    foreground=net_bg,
                    padding=0,
                ),


                # widget.TextBox(
                    # text="",
                    # background=net_bg,
                    # foreground=time_bg,
                    # fontsize=57,
                    # padding=-12,
                # ),
                widget.Sep(
                    background=time_bg,
                    foreground=time_bg,
                    padding=3,
                ),

               widget.TextBox(
                   text = ' ',
                   background = time_bg,
                   foreground = white,
                   padding = 10,
                   fontsize = universal_fontsize + 2
                ),

                widget.Clock(
                    format='%d / %m  [ %a ]  %I:%M:%S %p',
                    background=time_bg,
                    foreground=time_fg,
                    padding=5,
                    mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
                        terminal + ' -e tty-clock -c -C 1 -b -s')},
                    fontsize=universal_fontsize,
                ),
                widget.Sep(
                    background=time_bg,
                    foreground=time_bg,
                    padding=7,
                    height_percent=100,
                ),

                widget.TextBox(
                    text=" ",
                    background=onedarkRed,
                    foreground = net_fg,
                    fontsize=universal_fontsize + 1,
                    padding=8,
                    mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
                        terminal + ' -e shutdown now')} 
                ),
            ]

