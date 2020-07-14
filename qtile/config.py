# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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
default_margin = 4

# @hook.subscribe.startup_once
# def start_once():
    # subprocess.call('/home/anish/.config/qtile/autostart.sh')

os.system("exec compton -b")
os.system("nitrogen --restore &")

keys = [
        Key([mod, "shift"], "m", lazy.spawn("dmenu_run")),
        Key([mod], "c", lazy.spawn("code")),
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
    return {"border_width": 3,
            "margin": 0,
            "border_focus": "#800000",
            "border_normal": "#50EDCE"
            }

# layout_theme = init_layout_theme()


layouts = [
        layout.Tile(margin=default_margin),
        layout.Max(margin=default_margin),
        layout.Stack(num_stacks=2,margin=default_margin),
        layout.Bsp(margin=default_margin),
        layout.Columns(margin=default_margin),
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

topBar_bg = "#292d3e"
blue_bg = "#2bbac5"
time_bg="#783C96"
shutdown_color="#783C96"

months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
mn = str(datetime.datetime.now())[5:7]

screens = [
        Screen(
            top=bar.Bar(#1D96FF
                [
                    widget.TextBox(
                        text='',
                        background = topBar_bg,
                        foreground = blue_bg,
                        padding = 10,
                        fontsize = 17
                        ),
                    widget.CurrentLayout(
                        foreground = "#ffffff",
                        background = topBar_bg
                        ),
                    widget.GroupBox(
                        background = topBar_bg
                    ),
                    widget.WindowName(background = topBar_bg),
                    widget.TextBox(
                        text='vol:',
                        background = topBar_bg,
                        foreground = blue_bg,
                        padding = 1,
                        fontsize = 14
                        ),
                    widget.Volume(
                        background = topBar_bg,
                        padding = 8,
                        get_volume_command="",
                        volume_up_command=mod+"up",
                        volume_down_command=mod+"down"
                        ),
                    widget.TextBox(
                        text='',
                        background = topBar_bg,
                        foreground = blue_bg,
                        padding = 1,
                        fontsize = 30
                        ),
                    widget.Sep(
                        background = topBar_bg, 
                        foreground = topBar_bg,
                        padding=6,
                   ),
                    widget.Net(background = topBar_bg),
                    widget.Chord(
                        chords_colors={
                            'launch': ("#1D96F9", "#ffff00"),
                            },
                        background = topBar_bg,
                        name_transform=lambda name: name.upper(),
                        ),
                    widget.Systray(background = topBar_bg),
                    widget.Sep(
                        background = topBar_bg, 
                        foreground = topBar_bg,
                        padding=10,
                   ),
                    widget.TextBox(
                        text='',
                        background = topBar_bg,
                        foreground = blue_bg,
                        padding = 1,
                        fontsize = 25
                        ),
                    widget.Sep(
                        background = topBar_bg, 
                        foreground = topBar_bg,
                        padding=10,
                   ),
                    widget.Clock(
                        format='%d / %m %a [%I:%M] %p',
                        background = time_bg,
                        foreground = "#ffffff",
                        padding = 2
                        ),
                    widget.Sep(
                        background = shutdown_color, 
                        foreground = shutdown_color,
                        padding=10,
                        height_percent=100
                   ),
                    widget.QuickExit(
                            background = shutdown_color,
                            default_text = "",
                            fontsize = 17
                    ),
                    widget.Sep(
                        background = shutdown_color, 
                        foreground = shutdown_color,
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

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
