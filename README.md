Note: most of these commands will probably fail because there already is a file at the destination (i.e., you probably already have a ~/.bashrc). This is very much intended behaviour, as it forces you to rename, relocate or remove your existing config file consciously instead of just overwriting it. **This is not given for all these commands - some may permanently delete your existing config!** Make sure you are aware of this and back up all your configs before loading any new ones.

## gnome terminal
Save:
`dconf dump /org/gnome/terminal/ > ~/gterminal.preferences`

Install:
`cat ~/gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/`

## fish
`cd ~/.config/fish/ && ln -s </path/to/repo>/fish/config.fish`

## bash
`cd ~ && ln -s </path/to/repo>/.bashrc`

## vim
`cd ~ && ln -s </path/to/repo>/.vimrc`

## btop
`cd ~/.config/btop/ && ln -s </path/to/repo>/btop/btop.conf`

## devilspie2
`cd ~/.config/devilspie2/ && ln -s </path/to/repo>/devilspie2/config.lua && ln -s </path/to/repo>/devilspie2/remove_titlebar.lua`

## firefox
TODO
