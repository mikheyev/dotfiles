

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

setopt share_history # retrieve history and automatically add commands
setopt auto_cd

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
    # Sango paths
    path+=(/apps/unit/MikheyevU/novocraft /apps/unit/MikheyevU/sasha/NextGenMap/bin/ngm-0.4.12/)
    cdpath+=(/home/s/sasha/src)

elif [[ $HOST =~ homologous ]]; then
  path+=(~/bin) # This adds sublime text command 'subl'
fi

# Enable parenthesis autopair
## https://github.com/hlissner/zsh-autopair
source ~/.zprezto/plugins/zsh-autopair/zsh-autopair.plugin.zsh

