#!/bin/sh
##############################
# EXTERNAL ALIASES
##############################
alias j='z'
alias f='zi'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
# alias nvimrc='nvim ~/.config/nvim/'
# alias yay="paru"

# alias lvim='nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim"'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
# alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

####################
##   ALL SYSTEMS  ##
####################
# VARIABLES
# Define nano or micro
if [ -x "$(command -v micro)" ]; then
    # Micro as the default text editor
    export EDITOR='micro'
    alias m='micro'
    alias sm='sudo micro'
else
    export EDITOR='nano'
fi

###############################
##   Script for ZSH or BASH  ##
###############################

if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
    # assume Zsh
    # zsh $DOTFOLDER/custom_script.sh
    alias reload='source $DOTFOLDER/.zshrc'
    alias config='$EDITOR $DOTFOLDER/.zshrc'
elif [ -n "$($SHELL -c 'echo $BASH_VERSION')" ]; then
    # assume Bash
    # sh $DOTFOLDER/custom_script.sh
    alias reload='source $DOTFOLDER/.bashrc'
    alias config='$EDITOR $DOTFOLDER/.bashrc'
else
    # something else like fish
fi

alias aliases='$EDITOR $DOTFOLDER/.bash_aliases'

#Simple command to make a directory and then change to it
mkdircd(){ mkdir -p "$1" && cd "$1" ; }

###############
##   Linux   ##
###############

# if [ -x "$(command -v program_to_check)" ]; then
#    # <insert commands here>
# fi

# === CUSTOM ===
alias cls='clear'
alias back='cd $OLDPWD'
alias ssha='eval $(ssh-agent) && ssh-add'
alias mde='mkdircd' # Depends on the function defined above
alias setup-nala-legacy='echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list && wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null && sudo apt update && sudo apt install -y nala'
alias setup-nala='sudo apt update && sudo apt install -y nala'
alias df='df -Hl'
alias install-micro='sudo apt install xclip && curl https://getmic.ro | bash && mv micro /usr/local/bin/'
# Command below installs micro as the default system editor and must be executed from root user
alias install-micro-default='su - root -c "cd /usr/bin; wget -O- https://getmic.ro | GETMICRO_REGISTER=y sh"'
alias lsmount='mount | column -t'
alias extip='curl icanhazip.com'
# Needs python3 installed
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

# === NAVIGATION ===
alias home='cd ~'
alias cd..='cd ..'
alias cd...='...'
alias cd....='....'
alias cd.....='.....'
alias cd......='......'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias _='sudo '
alias s='sudo '
alias md='mkdir -p'
alias rmd='rm -fr '
alias rmf='rm -f '
alias x='exit'
alias la='ls -lAFq'


# === SYSTEM MANAGEMENT ===
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias root='sudo -i'
alias su='sudo -i'
alias wget='wget -c'
# alias ?='apropos'
alias myip='hostname -I | awk '\''{print }'\'''
# expand below with a search to return only the DNS and not all text
alias mydns='sudo resolvectl'

# === PACKAGE MANAGEMENT ===
if [ -x "$(command -v nala)" ]; then
    alias install='sudo nala install -y'
    alias upgrade='sudo nala update && sudo nala upgrade -y'
    alias update='sudo nala update'
    alias remove='sudo nala remove'
    alias clean='sudo nala clean'
    alias auto='sudo nala autopurge && sudo nala autoremove'
    alias search='nala search'
else
    alias install='sudo apt install -y'
    alias upgrade='sudo apt update && sudo  ugrade -y'
    alias update='sudo apt update'
    alias remove='sudo apt remove'
    alias clean='sudo apt clean'
    alias auto='sudo apt'
    alias search='apt search'
fi

# === DOCKER ===
if [ -x "$(command -v docker)" ]; then
	alias cup='docker compose up -d'
#	 alias d='docker'
#    alias dps='docker ps'
#    alias dps-all='docker ps -all'
#    alias dps-down='docker ps -f "status=exited"'
#    alias dstart='docker start'
#    alias dstop='docker stop'
#    alias dlist='docker images'
#    alias dup='docker compose up -d'

    # (Next Command) brings up all containers if one is not defined after dcup
#    alias dup='docker compose up -d'
    # (Next Command) brings down all containers if one is not defined after dcdown
#    alias ddown='docker compose stop'
    # (Next Command) pulls all new images is specified after dcpull
#    alias dpull='docker compose pull'
#    alias dlogs='docker compose logs -tf --tail="50" '  
#    alias dtail='docker logs -tf --tail="50" "$@"'
fi

# === Programs ===
if [ -x "$(command -v python3)" ]; then
    alias python='python3'
fi
if [ -x "$(command -v pip3)" ]; then
    alias pip='pip3'
fi

if [ -x "$(command -v exa)" ]; then
    alias ls="exa --icons --group-directories-first"
    # alias la="exa --long --icons --header --all --group --group-directories-first --git"
    alias la="exa --long --icons --header --all --group --group-directories-first"
    # alias tree="exa --long --icons --header --all --group --group-directories-first --git --tree"
    alias tree="exa --long --icons --header --all --group --group-directories-first --tree"
fi

if [ -x "$(command -v chezmoi)" ]; then
    alias cm='chezmoi'

    if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
        alias refresh="source $DOTFOLDER/.zshrc"
        alias config='chezmoi edit $DOTFOLDER/.zshrc'
    fi
    
    if [ -n "$($SHELL -c 'echo $BASH_VERSION')" ]; then
        alias refresh='source $DOTFOLDER/.bashrc'
        alias config='chezmoi edit $DOTFOLDER/.bashrc'
    fi
    
    # edits a file from the repo
    alias aliases='chezmoi edit $DOTFOLDER/.bash_aliases'
    # updates from changes in github
    alias apply='chezmoi apply'
    # initializes and updates from changes in github
    alias init='chezmoi init --apply claubervs'
fi

if [ -x "$(command -v bat)" ]; then
    alias cat='bat'
elif [ -x "$(command -v batcat)" ]; then
	alias cat='batcat'
fi

if [ -x "$(command -v lazygit)" ]; then
    alias lg='lazygit'
    alias g='lazygit'
fi

if [ -x "$(command -v chezmoi)" ]; then
	alias ld='lazydocker'
fi

if [ -x "$(command -v git)" ]; then
	alias clone-repo-compose='git clone --recurse-submodules -j8 https://github.com/claubervs/compose.git'
	alias clone-repo-ansible='git clone --recurse-submodules -j8 https://github.com/claubervs/ansible.git'
	alias clone-repo-dotfiles='git clone --recurse-submodules -j8 https://github.com/claubervs/dotfiles.git'
fi

# Detect kubectl installation and assign aliases
if [ -x "$(command -v kubectl)" ]; then
	alias k='kubectl'
	source <(kubectl completion bash)
fi

# Detect k3s installation and assign aliases
#if [ -x "$(command -v k3s)" ]; then
#	
#fi


###############
##   MACOS   ##
###############
bcubc='brew cask reinstall $(brew cask outdated) && brew cleanup'
bcubo='brew update && brew cask outdated'
brewp='brew pin'
brews='brew list -1'
brewsp='brew list --pinned'
bubc='brew upgrade && brew cleanup'
bubo='brew update && brew outdated'
bubu='bubo && bubc'
hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
