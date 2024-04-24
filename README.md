## Gnome
Save:
`dconf dump /org/gnome/terminal/ > ~/gterminal.preferences`

Install:

`cat ~/gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/`
