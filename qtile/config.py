import datetime
import os
import subprocess
import psutil
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen, ScratchPad, DropDown, Key, Match
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401
import Bar1
import Keys

# autostart applications
os.system("exec compton --backend glx --paint-on-overlay --vsync opengl-swc -b")
os.system("nitrogen --restore &")
os.system("setxkbmap us")  # changes keyboard layout to english us
os.system("systemctl stop docker mysql mongodb apache2")
os.system("xset r rate 250 100")

# Switches the primary display as the external display 
os.system("xrandr --output HDMI-1 --primary")
# sets the resolution of the external display
os.system("xrandr -s 1920x1080")

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


# default constants 
mod = "mod4"
default_margin = 4
default_border_color = white
default_border_width = 1
bar_opacity = 0.9
bar_thickness = 28

keys = Keys.keys

group_names = [(" ", {'layout': 'monadtall'}),
                (" ", {'layout': 'monadtall'}),
               (" ", {'layout': 'monadtall'}),
               (" ", {'layout': 'monadtall'}),
               (" ", {'layout': 'monadtall'}),
               ]

group_keys = "a,s,d,f,u,i,o,p".split(",")
groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(group_keys[i-1]), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(
        group_keys[i-1]), lazy.window.togroup(name)))

layouts = [
    layout.MonadTall(border_focus=default_border_color,
                     border_width=default_border_width, margin=default_margin, fullscreen_border_width=0),
    layout.Max(border_focus=default_border_color,
                     border_width=default_border_width, margin=default_margin),
    layout.Floating(border_focus="#fff", border_normal="#fff"),
]

def init_layout_theme():
    return {"border_width": 0,
            "margin": 10,
            "border_focus": "#FF5454",
            "border_normal": "#ffffff"
            }
layout_theme = init_layout_theme()

def init_border_args():
    return {"border_width": 2}


widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=0,
)
extension_defaults = widget_defaults.copy()

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

seperator_height = 50

screens = [
    Screen(
        bottom=bar.Bar(
            Bar1.top_bar_config1, bar_thickness,
            opacity=bar_opacity,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List#1D96F9
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wmclass': 'pcmanfm'}, # file manager 
    {'wmclass': 'Qalculate-gtk'}, # calculator
    {'wmclass': 'Guake'}, # floating terrminal 
    {'wmclass': 'terminator'}, # floating terrminal 
    {'wmclass': 'nitrogen'}, # floating terrminal 
    {'wmclass': 'sublime_text'}, # floating gui text editor
    {'wmclass': 'lxappearance'}, # floating gui text editor
    {'wmclass': 'gcr-prompter'},
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
], border_focus="#ffffff",
)

auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"
