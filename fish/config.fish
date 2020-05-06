# Go path stuff
set -g -x PATH /usr/local/go/bin /Users/nefelin/go/bin $PATH
set -xg GOPATH $HOME/go

#nvim path recommendation
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths

# Python path stuff
set -g -x PATH /Users/nefelin/Library/Python/3.6/bin $PATH

# AWS got installed here... 
set -g -x PATH /Users/nefelin/Library/Python/2.7/bin $PATH

# Misc custom path stuff 
set -g -x PATH /usr/local/bin /Users/nefelin/bin $PATH

# Haskell Recommended adding:
set -g -x PATH /Users/nefelin/.local/bin $PATH
set -x EDITOR "nvim"
set -x BROWSER open

set fish_greeting ""
set -x CLICOLOR 1
set -gx TERM xterm-256color

# NodeWars Testbox env variables
set -x COMPILEBOX_ADDRESS http://localhost
set -x COMPILEBOX_PORT 31337

set -x TESTBOX_ADDRESS http://localhost
set -x TESTBOX_PORT 31336

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif -e $EDITOR'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias v='f -e $EDITOR' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
alias o='a -e open' # quick opening files with xdg-open

# wunderline
alias wl='wunderline'

# spotify cli
alias lofi='sp s p lofi'

# quickdraw script
alias qd='quickdraw'

# utility aliases
alias fc='eval $EDITOR ~/.config/fish/config.fish'

alias nv='nvim'

alias prp="pipenv run python"

alias wd="cd ~/Documents/Covetrus/working_px/"

alias ov="printf 19Z9MPpW6y | pbcopy"

# Git aliases, better than functions for autocomplete
alias gc="git checkout"

alias rm="trash"
