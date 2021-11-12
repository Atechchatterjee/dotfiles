import datetime
import os
import subprocess
import psutil
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen, ScratchPad, DropDown, Key, Match
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401
from color import colors
import bar1
import keys

# autostart applications/configurations
os.system('setxkbmap us -option caps:escape')
os.system('xmodmap -e "keycode 9=grave asciitilde"')
os.system("exec compton --backend glx --paint-on-overlay --vsync opengl-swc -b")
os.system("nitrogen --restore &")
os.system("systemctl stop docker mysql mongodb apache2")
os.system("xset r rate 250 100")

# Switches the primary display as the external display 
os.system("xrandr --output HDMI-1 --primary")
# sets the resolution of the external display
os.system("xrandr -s 1920x1080")

# default constants 
mod = "mod4"
default_margin = 7
default_border_color = colors["white"]
default_border_width = 1
bar_opacity = 1
bar_thickness = 27

keys = keys.keys

group_names_font = [("web ", {'layout': 'monadtall'}),
                    ("dev", {'layout': 'monadtall'}),
                    ("term", {'layout': 'monadtall'}),
                    ("conf", {'layout': 'monadtall'}),
                    ("oth", {'layout': 'monadtall'}),
                   ]
group_names_icon = [(" ", {'layout': 'monadtall'}),
                    (" ", {'layout': 'monadtall'}),
                    (" ", {'layout': 'monadtall'}),
                    (" ", {'layout': 'monadtall'}),
                    (" ", {'layout': 'monadtall'}),
                   ]


group_names = group_names_icon
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
                     border_width=0, margin=default_margin),
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
# topBar_bg = "#101219"
topBar_bg = colors["nordBlue"]
currentLayout_bg = topBar_bg
memory_bg = colors["nordDBlue"]
net_bg = colors["gruvboxBrown"]
time_bg =  colors["nordDBlue"]
shutdown_bg = topBar_bg

groupBoxHighlight = colors["onedarkRed"]

# setting the foregroung colors
memory_fg = colors["white"]
net_fg = colors["white"]
time_fg = colors["white"]


def open_rofi(qtile):
    qtile.cmd_spawn('rofi -show drun -show-icons')

seperator_height = 50

screens = [
    Screen(
        top=bar.Bar(
            bar1.top_bar_config1, bar_thickness,
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
    {'wmclass': 'Qalculate-gtk'}, # calculator
    {'wmclass': 'Guake'}, # floating terrminal 
    {'wmclass': 'terminator'}, # floating terrminal 
    {'wmclass': 'nitrogen'}, # floating terrminal 
    {'wmclass': 'sublime_text'}, # floating gui text editor
    {'wmclass': 'kazam'}, # floating gui text editor
    {'wmclass': 'lxappearance'}, # floating gui text editor
    {'wmclass': 'gcr-prompter'},
    {'wname': 'http://localhost:3000 is sharing your screen.'},
    {'wmclass': 'zoom'},
    {'wmclass': 'Sign in - Google Accounts - Brave'},
    {'wmclass': 'droidcam'},
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'gnome-mpv'},  # ssh-askpass
], border_focus="#ffffff",
)

auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"
