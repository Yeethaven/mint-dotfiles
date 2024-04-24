Note: most of these commands will probably fail because there already is a file at the destination (i.e., you probably already have a ~/.bashrc). This is very much intended behaviour, as it forces you to rename, relocate or remove your existing config file consciously instead of just overwriting it. **This is not given for all these commands - some may permanently delete your existing config!** Make sure you are aware of this and back up all your configs before loading any new ones.

## gnome terminal
Save:
`dconf dump /org/gnome/terminal/ > ~/gterminal.preferences`

Install:
`cat ~/gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/`

## fish
`ln -s </path/to/repo>/fish/config.fish ~/.config/fish/`   

## bash
`ln -s </path/to/repo>/.bashrc ~/`

## vim
`ln -s </path/to/repo>/.vimrc ~/`

## btop
`ln -s </path/to/repo>/btop/btop.conf ~/.config/btop/`

## devilspie2
`ln -s </path/to/repo>/devilspie2/config.lua ~/.config/devilspie2/ && ln -s </path/to/repo>/devilspie2/remove_titlebar.lua ~/.config/devilspie2/`

## vscodium
`ln -s </path/to/repo>/vscodium/settings.json ~/.config/VSCodium/User/settings.json`

## firefox
TODO
