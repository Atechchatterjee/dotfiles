import datetime
import os
import subprocess
import psutil
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen, ScratchPad, DropDown, Key, Match
from libqtile.lazy import lazy
from color import colors
from libqtile.utils import guess_terminal

terminal = guess_terminal()

universal_fontsize = 11
seperator_width = 0

topBar_bg = "#101219"

# setting the background colors
pt1=colors["pt1"]
pt2=colors["pt1"]

groupBox_bg=topBar_bg
layout_bg=pt2
volume_bg=pt1
memory_bg=pt1
battery_bg=pt2
time_bg=pt1
shutdown_bg = colors["purple"]
groupBoxHighlight = colors["nordDBlue"]
seperator_bg = pt1
seperator_fg = colors["white"]

# setting the foregroung colors
memory_fg = colors["white"]
memoryText_fg=colors["icon"]

time_fg = colors["white"]

time_icon_fg=colors["icon"]

groupBox_fg=colors["white"]

layout_fg=colors["icon"]

volumeIcon_fg=colors["icon"]
volume_fg=colors["white"]

battery_fg=colors["white"]
batteryIcon_fg=colors["icon"]

shutdown_fg = colors["white"]

def open_rofi(qtile):
    qtile.cmd_spawn('rofi -show drun')

top_bar_config1 = [
                widget.TextBox(
                    text=' ',
                    background=pt1,
                    foreground=colors["white"],
                    padding=8,
                    fontsize=universal_fontsize + 3,
                    mouse_callbacks={'Button1': open_rofi},
                ),
                # widget.Sep(
                    # background=topBar_bg,
                    # foreground=topBar_bg,
                    # padding=7,
                # ),
                widget.GroupBox(
                    background=groupBox_bg,
                    padding = 6,
                    highlight_color=groupBoxHighlight,
                    highlight_method="line",
                    center_aligned=True,
                    rounded=True,
                    fontsize=universal_fontsize+2,
                    this_current_screen_border = colors["purple"],
                    other_screen_border = colors["icon"]
                ),

                widget.Sep(
                    background=topBar_bg,
                    foreground=topBar_bg,
                    padding=10,
                ),

                widget.WindowName(
                    background=topBar_bg,
                    foreground="#CECECE",
                    fontsize=universal_fontsize,
                    padding=10,
                ),
                widget.Sep(
                    background=pt1,
                    foreground=pt1,
                    padding=2,
                ),
                widget.Systray(
                    background=pt1,
                    fontsize=universal_fontsize,
                    margin_y=25,
                    padding=1,
                ),
                widget.Sep(
                    background=pt1,
                    foreground=pt1,
                    padding=8
                ),
                widget.Sep(
                    background=seperator_bg,
                    foreground=seperator_fg,
                    linewidth=seperator_width,
                    padding=3
                ),
                widget.TextBox(
                    text=' ',
                    background=volume_bg,
                    foreground=volumeIcon_fg,
                    padding=8,
                    fontsize=universal_fontsize + 4,
                ),

                widget.Volume(
                    background=volume_bg,
                    padding=8,
                    mute_command="pactl set-sink-mute 0 toggle",
                    volume_up_command="amixer set Master 2%+",
                    volume_down_command="amixer set Master 2%-",
                    fontsize=universal_fontsize,
                ),

                widget.Sep(
                    background=seperator_bg,
                    foreground=seperator_fg,
                    linewidth=seperator_width,
                    padding=3
                ),

               widget.TextBox(
                   text = '',
                   background = layout_bg,
                   foreground = layout_fg,
                   padding = 10,
                   fontsize = universal_fontsize + 4
                ),

                widget.CurrentLayout(
                    foreground="#ffffff",
                    background=layout_bg,
                    fontsize=universal_fontsize,
                    padding=8
                ),

                widget.Sep(
                    background=seperator_bg,
                    foreground=seperator_fg,
                    linewidth=seperator_width,
                    padding=3
                ),

               widget.TextBox(
                   text = '',
                   background = memory_bg,
                   foreground = memoryText_fg,
                   padding = 10,
                   fontsize = universal_fontsize + 3
                ),

                widget.Memory(
                    background=memory_bg,
                    foreground=memory_fg,
                    padding=8,
                    mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
                        terminal + ' -e bpytop')},
                    fontsize=universal_fontsize,
                ),

                widget.Chord(
                    chords_colors={
                        'launch': ("#1D96F9", "#ffff00"),
                    },
                    background=memory_bg,
                    name_transform=lambda name: name.upper(),
                    fontsize=universal_fontsize,
                ),

                widget.Sep(
                    background=seperator_bg,
                    foreground=seperator_fg,
                    linewidth=seperator_width,
                    padding=3
                ),

                widget.TextBox(
                        text=" ",
                    background=battery_bg,
                    foreground=batteryIcon_fg,
                    fontsize=universal_fontsize,
                    padding = 7
                ),
                widget.Battery(
                    format=' {percent:2.0%} ',
                    battery=0,
                    background=battery_bg,
                    charge_char='<',
                    discharge_char='*',
                    low_percentage=0.2,
                    low_foreground=colors["nordRed"],
                    padding=10,
                ),

                # widget.Sep(
                    # background=seperator_bg,
                    # foreground=seperator_fg,
                    # linewidth=seperator_width,
                    # padding=3
                # ),

                widget.Sep(
                    background=battery_bg,
                    foreground=battery_bg,
                    padding=0,
                ),
                # widget.Sep(
                    # background=time_bg,
                    # foreground=time_bg,
                    # padding=3,
                # ),
               widget.TextBox(
                   text = ' ',
                   background = time_bg,
                   foreground = time_icon_fg,
                   padding = 10,
                   fontsize = universal_fontsize + 4
                ),

                widget.Clock(
                    format='%d / %m  |  %a  |  %I:%M:%S %p',
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
                    background=shutdown_bg,
                    foreground = shutdown_fg,
                    fontsize=universal_fontsize + 1,
                    padding=10,
                    mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
                        terminal + ' -e shutdown now')}
                ),
            ]

