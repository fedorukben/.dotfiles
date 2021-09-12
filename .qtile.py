from typing import List

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "urxvt"
browser = "qutebrowser"
editor = "vim"
run_launcher = "rofi -show run"

keys = [
    Key([mod],                  "h",               lazy.layout.left(),                          desc="Move focus to left"),
    Key([mod],                  "l",               lazy.layout.right(),                         desc="Move focus to right"),
    Key([mod],                  "j",               lazy.layout.down(),                          desc="Move focus down"),
    Key([mod],                  "k",               lazy.layout.up(),                            desc="Move focus up"),
    Key([mod],                  "space",           lazy.layout.next(),                          desc="Move window focus to other window"),
    Key([mod, "shift"],         "l",               lazy.layout.shuffle_right(),                 desc="Move window to the right"),
    Key([mod, "shift"],         "j",               lazy.layout.shuffle_down(),                  desc="Move window down"),
    Key([mod, "shift"],         "k",               lazy.layout.shuffle_up(),                    desc="Move window up"),
    Key([mod, "control"],       "h",               lazy.layout.grow_left(),                     desc="Grow window to the left"),
    Key([mod, "control"],       "l",               lazy.layout.grow_right(),                    desc="Grow window to the right"),
    Key([mod, "control"],       "j",               lazy.layout.grow_down(),                     desc="Grow window down"),
    Key([mod, "control"],       "k",               lazy.layout.grow_up(),                       desc="Grow window up"),
    Key([mod],                  "n",               lazy.layout.normalize(),                     desc="Reset all window sizes"),
    Key([mod, "shift"],         "Return",          lazy.layout.toggle_split(),                  desc="Toggle between split and unsplit sides of stack"),
    Key([mod],                  "Return",          lazy.spawn(terminal),                        desc="Launch terminal"),
    Key([mod],                  "w",               lazy.spawn(browser),                         desc="Launch browser"),
    Key([mod],                  "Tab",             lazy.next_layout(),                          desc="Toggle between layouts"),
    Key([mod],                  "p",               lazy.spawn(run_launcher),                    desc="Launch the run launcher"),
    Key([mod, "shift"],         "c",               lazy.window.kill(),                          desc="Kill focused window"),
    Key([mod],                  "q",               lazy.restart(),                              desc="Restart Qtile"),
    Key([mod, "shift"],         "q",               lazy.shutdown(),                             desc="Shutdown Qtile"),
    Key([mod],                  "r",               lazy.spawncmd(),                             desc="Spawn a command using a prompt widget"),
]

group_names = [
        ('www',       {'layout': 'columns'}),
        ('dev',       {'layout': 'columns'}),
        ('todo',      {'layout': 'columns'}),
        ('chat',      {'layout': 'columns'})
    ]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layouts = [
    layout.Columns(border_focus_stack='#d75f5f'),
    layout.Max(),
    layout.MonadTall(
        font = "Ubuntu",
        fontsize = 10,
        margin = 8
    ),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.QuickExit(),
            ],
            24,
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

wmname = "LG3D"
