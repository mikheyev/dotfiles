

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

# Emacs shell mode doesn't work
# http://emacs.stackexchange.com/questions/19848/weird-characters-in-shell-mode-with-zsh
if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

# Host-specific configuration
if [[ $HOST =~ sango ]]; then 
   module load git/2.3.2 \
   bedtools/v2.25.0 \
   samtools/1.2 \
   bowtie2/2.2.6 \
   R/3.1.1
    #SLURM aliases
  alias sq='squeue -u sasha'

elif [[ $HOST =~ homologous ]]; then
  path+=(~/bin) # This adds sublime text command 'subl'
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


#  _____   __    ______   _       __________  __________________
# /__  /  / /   / ____/  | |     / /  _/ __ \/ ____/ ____/_  __/
#   / /  / /   / __/     | | /| / // // / / / / __/ __/   / /
#  / /__/ /___/ /___     | |/ |/ // // /_/ / /_/ / /___  / /
# /____/_____/_____/     |__/|__/___/_____/\____/_____/ /_/


zlewidget() {
  # bindkey KEY to new WIDGET, possibly implemented by optional FUNCTION.
  # FUNCTION defaults to WIDGET and will be marked for autoload -Uz.

  local key=$1
  local widget=$2
  local function=${3:-$2}

  autoload -Uz $function
  zle -N $widget $function
  bindkey $key $widget
}
zlewidget '^xx' expand-absolute-path