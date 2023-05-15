if status is-interactive
    # Commands to run in interactive sessions can go here
end


# ----- Aliases -----

# Basics
alias l='exa -ahl'
alias ls='exa'
alias ls!='command ls'
alias sc='source ~/.config/fish/config.fish'
alias c='clear'
alias inf='inxi -Fxzd'
alias svim='sudo vim'
alias vb='vim ~/.config/fish/config.fish'
alias vc='vb'
alias vv='vim ~/.vimrc'
alias pdfcombine='echo pdftk A=in1 B=in2 cat A1-10 B A11-15 output out.pdf'
alias vs='vim ~/.ssh/config'

# Uni
alias cip='ssh or38uqot@cip2a0.cip.cs.fau.de'

# NordVPN
alias nlog='nordvpn login'
alias ncon='nordvpn connect'
alias ndis='nordvpn disconnect'
alias nstat='nordvpn status'


# ----- Functions -----

function cleanup
    sudo apt-get autoclean
    sudo deborphan | xargs sudo apt-get -y remove --purge
    sudo apt autoremove
	sudo apt-get clean
end

function pdfmerge
    pdftk $argv[1] $argv[2] cat output $argv[3]
end

#function pdfcompress TODO
#    gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=(string replace -r "\.pdf$" ".compressed.pdf" $argv[1]) $argv[1]
#end


# ------ fish config -----


# prompt
function fish_prompt
    echo -n "["
    set_color -o blue
    echo -n (date +%H:%M)
    set_color normal
    echo -n "] ["
    set_color --bold green
    echo -n $USER
    set_color normal
    echo -n "]──["
    set_color --bold cyan
    echo -n (string replace -r "^$HOME" "~" (pwd))
    set_color normal
    echo -n "] \$ "
end

function fish_right_prompt
    #intentionally left blank
end

set fish_greeting #[greeting goes here]
