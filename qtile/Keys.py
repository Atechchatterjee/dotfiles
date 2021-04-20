import datetime
import os
import subprocess
import psutil
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen, ScratchPad, DropDown, Key, Match
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401

mod = "mod4"

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

terminal = guess_terminal()

myBrowser = "brave-browser"
guiFileManager = "pcmanfm"
default_margin = 0
default_border_width = 1
bar_opacity = 0.9
bar_thickness = 28
universal_fontsize = 12

keys = [
    Key([mod, "shift"], "n", lazy.spawn('rofi -show drun -drun-icon-theme Tela')),
    Key([mod], "Tab", lazy.spawn('rofi -show window')),
    Key([mod, "control"], "g", lazy.spawn(terminal + " -e start-stop-daemon -SbCv -x ~/.config/neovide")),
    Key([mod], "z", lazy.hide_show_bar("top")),
    Key([mod], "m", lazy.spawn("pcmanfm")),
    Key([mod], "c", lazy.spawn("code")),
    Key([mod], "b", lazy.spawn(myBrowser)),
    Key([mod], "n", lazy.spawn("nitrogen")),
    Key([mod], "g", lazy.spawn("google-chrome")),
    Key([mod, "shift"], "g", lazy.spawn(terminal + " -e tmux new-session -d ~/.config/neovide/target/release/neovide --multiGrid")),
    Key([mod], "w", lazy.spawn("qalculate")),
    Key([mod], "v", lazy.spawn(terminal+" -e vifm")),
    Key([mod, "control"], "d", lazy.spawn(guiFileManager)),
    Key([mod, "shift"], "q",
        lazy.spawn(terminal+" -e shutdown now"),
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
    Key([mod], "equal", lazy.spawn("amixer -c 0 -q set Master 1dB+")),
    Key([mod], "minus", lazy.spawn("aixer -c 0 -q set Master 1dB-")),

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
