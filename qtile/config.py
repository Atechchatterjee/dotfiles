import datetime
import os
import subprocess
import psutil
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen, ScratchPad, DropDown, Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401

# default constants 
mod = "mod4"
terminal = guess_terminal()
myBrowser = "google-chrome"
guiFileManager = "dolphin"
default_margin = 6
default_border_color = "#F28282"
default_border_width = 1
bar_opacity = 0.8

# autostart applications
os.system("exec compton -b")
os.system("nitrogen --restore &")
os.system("setxkbmap us")  # changes keyboard layout to english us
os.system("systemctl stop docker mysql mongodb apache2")
os.system("xset r rate 250 100")
# Switches the primary display as the external display 
os.system("xrandr --output HDMI-1 --primary")
# sets the resolution of the external display
os.system("xrandr -s 1920x1080")


# hide the topbar
def hide_show_bar(qtile):
    bar = qtile.currentScreen.top
    if bar.size == 0:
        bar.size = 30
        bar.window.unhide()
    else:
        bar.size = 0
        bar.window.hide()
        qtile.currentGroup.layoutAll()


keys = [
    Key([mod], "l", lazy.spawn("/usr/lib/kscreenlocker_greet")),
    Key([mod, "shift"], "n", lazy.spawn('rofi -show drun -show-icons')),
    Key([mod], "Tab", lazy.spawn('rofi -show window')),
    Key([mod], "z", lazy.hide_show_bar("top")),
    Key([mod], "m", lazy.spawn("dmenu_run")),
    Key([mod], "c", lazy.spawn("code")),
    Key([mod], "b", lazy.spawn(myBrowser)),
    Key([mod], "n", lazy.spawn("nitrogen")),
    Key([mod], "g", lazy.spawn("google-chrome")),
    Key([mod], "v", lazy.spawn(terminal+" -e vifm")),
    Key([mod, "control"], "d", lazy.spawn(guiFileManager)),
    Key([mod, "shift"], "q",
        lazy.spawn(terminal+" -e shutdown now"),
        desc='Shutdown Qtile'
        ),
    Key([mod, "shift"], "r",
        lazy.spawn(terminal+" -e reboot"),
        desc='Shutdown Qtile'
    ),
    Key([mod, "control"], "s", lazy.spawn(terminal+" -e systemctl suspend")),

    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(),
        desc="Move focus up in stack pane"),
    Key([mod], "h", lazy.layout.left(),
        desc="Move focus up in stack pane"),
    Key([mod], "l", lazy.layout.right(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Toggles fullscreen
    Key([mod, "shift"], "m",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    # Grow size up, down, left, and right
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "f", lazy.window.toggle_floating()),

    # Also allow changing volume the old fashioned way.
    Key([mod], "equal", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([mod], "minus", lazy.spawn("amixer -c 0 -q set Master 2dB-")),

    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    # Swap panes of split stack
    Key(["control", "shift"], "space", lazy.layout.rotate()),
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),

    Key([mod, "shift"], "l", lazy.layout.flip_right()),
    Key([mod, "shift"], "h", lazy.layout.flip_left()),
]

group_names = [("Web", {'layout': 'monadtall'}),
               ("Dev", {'layout': 'monadtall'}),
               ("Class", {'layout': 'monadtall'}),
               ("Conf", {'layout': 'monadtall'}),
               ("Test", {'layout': 'monadtall'}),
               ("Med", {'layout': 'monadtall'}),
               ("Float", {'layout': 'floating'}),
               ("Other", {'layout': 'monadtall'})
               ]

group_keys = "a,s,d,f,u,i,o,p".split(",")
groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(group_keys[i-1]), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(
        group_keys[i-1]), lazy.window.togroup(name)))


def init_layout_theme():
    return {"border_width": 0,
            "margin": 8,
            "border_focus": "#FF5454",
            "border_normal": "#50EDCE"
            }


layout_theme = init_layout_theme()


def init_border_args():
    return {"border_width": 2}


layouts = [
    layout.MonadTall(border_focus=default_border_color,
                     border_width=default_border_width, margin=default_margin),
    layout.Max(border_focus=default_border_color,
                     border_width=default_border_width, margin=default_margin),
    layout.Floating(),
]
widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=0,
)
extension_defaults = widget_defaults.copy()


# available colors for topbar
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

topBar_bg = black 

# setting the background colors
currentLayout_bg = topBar_bg
memory_bg = nordDBlue
net_bg = gruvboxBrown 
time_bg = nordDBlue 
shutdown_bg = topBar_bg

groupBoxHighlight = nordDBlue 

# setting the foregroung colors
memory_fg = white
net_fg = white
time_fg = white

universal_fontsize = 10

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    background=currentLayout_bg,
                    foreground=currentLayout_bg,
                    padding=5,
                ),

                widget.GroupBox(
                    border=onedarkRed,
                    border_width=2,
                    background=topBar_bg,
                    foreground=purple,
                    highlight_color=groupBoxHighlight,
                    highlight_method="line",
                    center_aligned=True,
                    rounded=True,
                    fontsize=universal_fontsize,
                ),
                widget.Sep(
                    background=topBar_bg,
                    foreground=topBar_bg,
                    padding=10,
                ),
                widget.WindowName(
                    background=topBar_bg,
                    foreground=topBar_bg,
                    fontsize=universal_fontsize,
                ),
                widget.TextBox(
                    text='vol:',
                    background=topBar_bg,
                    foreground=onedarkBlue,
                    padding=1,
                    fontsize=universal_fontsize,
                ),
                widget.Volume(
                    background=topBar_bg,
                    padding=8,
                    get_volume_command="",
                    volume_up_command="amixer -q -D pulse set Master 1%+",
                    volume_down_command="amixer -q -D pulse set Master 1%-",
                    fontsize=universal_fontsize,
                ),
                widget.TextBox(
                    text="",
                    background=topBar_bg,
                    foreground=net_bg,
                    fontsize=universal_fontsize+47,
                    padding=-12,
                ),
                widget.CurrentLayout(
                    foreground="#ffffff",
                    background=net_bg,
                    fontsize=universal_fontsize,
                    padding=8
                ),
                widget.TextBox(
                    text="",
                    background=net_bg,
                    foreground=memory_bg,
                    fontsize=universal_fontsize+47,
                    padding=-12,
                ),
                widget.Memory(
                    background=memory_bg,
                    foreground=memory_fg,
                    padding=8,
                    mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
                        terminal + ' -e htop')},
                    fontsize=universal_fontsize,
                ),

                widget.TextBox(
                    text="",
                    background=memory_bg,
                    foreground=net_bg,
                    fontsize=57,
                    padding=-12
                ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#1D96F9", "#ffff00"),
                    },
                    background=net_bg,
                    name_transform=lambda name: name.upper(),
                    fontsize=universal_fontsize,
                ),
                widget.Sep(
                    background=net_bg,
                    foreground=net_bg,
                    padding=0,
                ),
                widget.Systray(
                    background=net_bg,
                    fontsize=universal_fontsize,
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

                widget.TextBox(
                    text="",
                    background=net_bg,
                    foreground=time_bg,
                    fontsize=57,
                    padding=-12,
                ),
                widget.Sep(
                    background=time_bg,
                    foreground=time_bg,
                    padding=3,
                ),
                widget.Clock(
                    format='%d / %m %a %I:%M:%S %p',
                    background=time_bg,
                    foreground=time_fg,
                    padding=2,
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

            ],
            18,
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
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"
