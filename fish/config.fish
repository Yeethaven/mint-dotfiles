if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ----- Sources -----
source /usr/share/autojump/autojump.fish
eval (opam env)

# ----- Aliases -----

# Alternatives for tools
alias cat batcat
alias bat batcat
alias l 'exa -aahl'
alias ls exa
alias ls! 'command ls'
alias find fdfind
alias fd fdfind
alias find! 'command find'
alias grep rga
alias grep! 'command grep'
alias grep-interactive rga-fzf
alias rga-i rga-fzf
alias search rga-fzf
#alias cd j
#alias cd! 'command cd'

# Basics
alias sc 'source ~/.config/fish/config.fish'
alias c clear
alias inf 'inxi -Fxzd'
alias svim 'sudo vim'
alias vb 'vim ~/.config/fish/config.fish'
alias vc 'vb'
alias vv 'vim ~/.vimrc'
alias pdfcombine 'echo pdftk A=in1 B=in2 cat A1-10 B A11-15 output out.pdf'
alias vs 'vim ~/.ssh/config'
alias usg 'du -ah --max-depth=1'
alias amt 'ls -la | wc -l'


# Uni
alias cip 'ssh or38uqot@cip2a0.cip.cs.fau.de'

# NordVPN
alias nlog 'nordvpn login'
alias ncon 'nordvpn connect'
alias ndis 'nordvpn disconnect'
alias nstat 'nordvpn status'

# 2nd discord instance
alias disco2 '/bin/bash -c "export XDG_CONFIG_HOME=~/.nya; export TMPDIR=~/nya; discord"'

# ----- Environment -----
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"


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

function rga-fzf
    set RG_PREFIX 'rga --files-with-matches'
    if test (count $argv) -gt 1
        set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
    end
    set -l file $file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && \
    echo "opening $file" && \
    open "$file"
end

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
	echo -n "@"
	echo -n $hostname
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

function fish_greeting 
	#cmatrix -bs
end
