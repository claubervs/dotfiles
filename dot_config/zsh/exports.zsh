#!/bin/sh
###########################################
# ZSH CONFIGURATIONS
###########################################
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZ

# Usefull options from (man zshpoptions)
unsetopt beep # stops annoying beep
unsetopt correct_all # autocorrect commands
unsetopt correct
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt autocd extendedglob nomatch notify menucomplete
setopt interactive_comments
zle_highlight=('paste:none')


# COMPINIT
zstyle :compinstall filename '/home/clauber/.zshrc'
# Completions
# select completions with arrow keys and is case insensitive
zstyle ':completion:*' menu select matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# group results by category
zstyle ':completion:*' group-name ''
# enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate
# zstyle ':completion::complete:lsof:*' menu yes select

zmodload zsh/complist
autoload -Uz compinit && compinit -i
# compinit
_comp_options+=(globdots) # Include hidden files.
autoload -U up-line-or-beginning-search
autoload -U downline-or-beginning-search
zle -N upline-or-beginning-search
zle -N dsownline-or-beginning-search

###########################################
# DEFAULT VARIABLES
###########################################
export BROWSER="brave"
# export MANPAGER='nvim +Man!'
# export MANWIDTH=999
# export XDG_CURRENT_DESKTOP="Wayland"

###########################################
# INCLUDING DIRECTORY LOCATIONS
###########################################
export DOTFOLDER='/home/clauber'

export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/bin":$PATH
export PATH="/usr/local/bin":$PATH
export PATH="/home/linuxbrew/.linuxbrew/bin/":$PATH

# Default location for snap packages
export PATH="/snap/bin/":$PATH
# Default location for cargo packages
export PATH=$HOME/.cargo/bin:$PATH

# export PATH=$HOME/.local/share/go/bin:$PATH
# export GOPATH=$HOME/.local/share/go
# export PATH=$HOME/.fnm:$PATH
# export PATH="$HOME/.local/share/neovim/bin":$PATH