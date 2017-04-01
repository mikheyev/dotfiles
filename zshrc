

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

#load modules if on cluster
if [ $HOST~/sango/ ]; then 
   module load git/2.3.2 \
   bedtools/v2.25.0 \
   samtools/1.2 \
   bowtie2/2.2.6 \
   R/3.1.1
fi  

#SLURM commands
alias sq='squeue -u sasha'

# Enable calculator
source ~/.zprezto/plugins/calc.plugin.zsh/calc.plugin.zsh