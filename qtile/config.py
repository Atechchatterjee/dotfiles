import os
import subprocess
import psutil
import datetime

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()
myBrowser = "google-chrome"
default_margin = 7

# @hook.subscribe.startup_once
# def start_once():
    # subprocess.call('/home/anish/.config/qtile/autostart.sh')

os.system("exec compton -b")
os.system("nitrogen --restore &")

keys = [
        Key([mod, "shift"], "m", lazy.spawn("dmenu_run")),
        Key([mod], "c", lazy.spawn("code")),
        Key([mod], "b", lazy.spawn(myBrowser)),
        Key([mod], "n", lazy.spawn("nitrogen")),
        # Switch between windows in current stack pane
        Key([mod], "k", lazy.layout.down(),
            desc="Move focus down in stack pane"),
        Key([mod], "j", lazy.layout.up(),
            desc="Move focus up in stack pane"),

        # Move windows up or down in current stack
        # Key([mod, "control"], "k", lazy.layout.shuffle_down(),
            # desc="Move window down in current stack "),
        # Key([mod, "control"], "j", lazy.layout.shuffle_up(),
            # desc="Move window up in current stack "),

        # Switch window focus to other pane(s) of stack
        Key([mod], "space", lazy.layout.next(),
            desc="Switch window focus to other pane(s) of stack"),

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
        Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

        Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
        Key([mod], "r", lazy.spawncmd(),
            desc="Spawn a command using a prompt widget"),
        #Grow size up, down, left, and right
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
        Key(["control", "shift"], "f", lazy.window.toggle_floating()),
        # Key([mod], "=", os.system("exec amixer -q -D pulse set Master 2%+")),
        # Key([mod], "-", os.system("exec amixer -q -D pulse set Master 2%-")),

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

groups = [Group(i) for i in "asdfuiop"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
        ])

def init_layout_theme():
    return {"border_width": 0,
            "margin": 0,
            "border_focus": "#800000",
            "border_normal": "#50EDCE"
            }

# layout_theme = init_layout_theme()


layouts = [
        layout.Columns(margin=default_margin),
        layout.Tile(margin=default_margin),
        layout.Max(margin=default_margin),
        layout.Stack(num_stacks=2,margin=default_margin),
        layout.Bsp(margin=default_margin),
        layout.Matrix(margin=default_margin),
        layout.MonadTall(margin=default_margin),
        layout.MonadWide(margin=default_margin),
        layout.RatioTile(margin=default_margin),
        layout.TreeTab(margin=default_margin),
        layout.VerticalTile(margin=default_margin),
        layout.Zoomy(margin=default_margin),
        ]

widget_defaults = dict(
        font='sans',
        fontsize=12,
        padding=0,
        )
extension_defaults = widget_defaults.copy()


# colors
onedarkBlue="#3C909B"
onedarkRed="#BE5046"
purple = "#783C96"
gruvboxRed="#F94B3F"
gruvboxAqua="#689D6A"
gruvboxBrown="#1D2021"
gruvboxOrange="#D65F34"
topBar_bg = "#292d3e"
blue_bg = "#2bbac5"

currentLayout_bg = topBar_bg
net_bg = onedarkRed
time_bg = purple 
shutdown_bg = purple


months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
mn = str(datetime.datetime.now())[5:7]

screens = [
        Screen(
            top=bar.Bar(#1D96FF
                [
                    widget.Sep(
                        background = currentLayout_bg,
                        foreground = currentLayout_bg,
                        padding=10,
                   ),
                    widget.CurrentLayout(
                        foreground = "#ffffff",
                        background = currentLayout_bg,
                        ),
                    widget.Sep(
                        background = currentLayout_bg,
                        foreground = currentLayout_bg,
                        padding=10,
                   ),
                        
                    widget.GroupBox(
                        border=onedarkRed,
                        border_width=2,
                        background = topBar_bg
                    ),
                    widget.Sep(
                        background = topBar_bg,
                        foreground = topBar_bg,
                        padding=10,
                   ),
                    widget.WindowName(background = topBar_bg, foreground = topBar_bg),
                    widget.TextBox(
                        text='vol:',
                        background = topBar_bg,
                        foreground = onedarkBlue,
                        padding = 1,
                        fontsize = 14
                        ),
                        
                    widget.Volume(
                        background = topBar_bg,
                        padding = 8,
                        get_volume_command="",
                        volume_up_command="amixer -q -D pulse set Master 3%+",
                        volume_down_command="amixer -q -D pulse set Master 3%-"
                        ),

                    widget.TextBox(
                        text = "",
                        background = topBar_bg,
                        foreground = net_bg,
                        fontsize=57,
                        padding = -12 
                        ),
                    widget.Sep(
                        background = net_bg, 
                        foreground = net_bg,
                        padding=10,
                   ),
                    widget.Net(background = net_bg),
                    widget.Chord(
                        chords_colors={
                            'launch': ("#1D96F9", "#ffff00"),
                            },
                        background = net_bg,
                        name_transform=lambda name: name.upper(),
                        ),
                    widget.Sep(
                        background = net_bg, 
                        foreground = net_bg,
                        padding=10,
                   ),
                    widget.Systray(background = onedarkBlue),
                    widget.Sep(
                        background = net_bg, 
                        foreground = net_bg,
                        padding=10,
                   ),

                    widget.TextBox(
                        text = "",
                        background = net_bg,
                        foreground = time_bg,
                        fontsize=57,
                        padding = -12 
                        ),
                    widget.Sep(
                        background = time_bg,
                        foreground = time_bg,
                        padding=10,
                   ),
                    widget.TextBox(
                        text='',
                        background = time_bg,
                        foreground = gruvboxBrown,
                        padding = 1,
                        fontsize = 25
                        ),
                    widget.Sep(
                        background = time_bg,
                        foreground = time_bg,
                        padding=10,
                   ),
                    widget.Clock(
                        format='%d / %m %a [%I:%M] %p',
                        background = time_bg,
                        foreground = "#ffffff",
                        padding = 2
                        ),
                    widget.Sep(
                        background = time_bg, 
                        foreground = time_bg,
                        padding=10,
                        height_percent=100
                   ),

                    widget.QuickExit(
                            background = shutdown_bg,
                            default_text = "",
                            fontsize = 17
                    ),
                    widget.Sep(
                        background = shutdown_bg, 
                        foreground = shutdown_bg,
                        padding=10,
                   ),
                    ],
                20,
                ),
            )
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
