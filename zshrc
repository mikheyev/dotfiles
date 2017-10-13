

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

setopt share_history # retrieve history and automatically add commands

#CHECK -- should not be necessary with agnoster
# # Emacs shell mode doesn't work
# # http://emacs.stackexchange.com/questions/19848/weird-characters-in-shell-mode-with-zsh
# if [[ $TERM = dumb ]]; then
#   unset zle_bracketed_paste
# fi

# Host-specific configuration
if [[ $HOST =~ sango ]]; then 
   module use /work/.apps/unit/MikheyevU/.modulefiles
    #SLURM aliases
  cdpath+=($HOME/src)
  alias sq='squeue -u sasha'

elif [[ $HOST =~ homologous ]]; then
  # disable version control on checks on sshfs mounted folders for increased speed  
  zstyle ':vcs_info:*' disable-patterns "$HOME/sango(|/*)"
  cdpath+=($HOME/sango/home)
  path+=(~/bin) # This adds sublime text command 'subl'
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  alias sfs='sshfs login.oist.jp:/home/s/sasha/src/ ~/sango -o auto_cache,reconnect,defer_permissions,noappledouble '
fi

# Enable calculator
source ~/.zprezto/plugins/calc.plugin.zsh/calc.plugin.zsh

# Bioinformatics
source ~/dotfiles/bioinformatic_functions.sh

#     ___    __    __                   _       __  _
#    /   |  / /_  / /_  ________ _   __(_)___ _/ /_(_)___  ____  _____
#   / /| | / __ \/ __ \/ ___/ _ \ | / / / __ `/ __/ / __ \/ __ \/ ___/
#  / ___ |/ /_/ / /_/ / /  /  __/ |/ / / /_/ / /_/ / /_/ / / / (__  )
# /_/  |_/_.___/_.___/_/   \___/|___/_/\__,_/\__/_/\____/_/ /_/____/

# http://zshwiki.org/home/examples/zleiab

setopt extendedglob
typeset -Ag abbreviations
abbreviations=(
  "Im"    "| more"
  "Ia"    "| awk"
  "Ig"    "| grep"
  "Ieg"   "| egrep"
  "Iag"   "| agrep"
  "Ip"    "| $PAGER"
  "Ih"    "| head"
  "It"    "| tail"
  "Is"    "| sort"
  "Iv"    "| ${VISUAL:-${EDITOR}}"
  "Iw"    "| wc"
  "Iwl"   "| wc -l"
  "Ix"    "| xargs"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
