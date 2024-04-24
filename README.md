## Gnome
Save:
`dconf dump /org/gnome/terminal/ > ~/gterminal.preferences`

Install:
`cat ~/gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/`

## Fish
`cd ~/.config/fish/ && ln -s </path/to/repo>/fish/config.fish`

## vim
`cd ~ && ln -s </path/to/repo>/.vimrc`

## btop
`cd ~/.config/btop/ && ln -s </path/to/repo>/btop/btop.conf`

## devilspie2
`cd ~/.config/devilspie2/ && ln -s </path/to/repo>/devilspie2/config.lua && ln -s </path/to/repo>/devilspie2/remove_titlebar.lua`

## firefox
TODO
