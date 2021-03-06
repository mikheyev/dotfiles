#!/bin/bash
#################################3
## File used for defining $PS1
# Modified from:
# http://stackoverflow.com/questions/103857/what-is-your-favorite-bash-prompt

bash_prompt_command() {
# How many characters of the $PWD should be kept
local pwdmaxlen=25
# Indicate that there has been dir truncation
local trunc_symbol=".."
local dir=${PWD##*/}
pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
NEW_PWD=${PWD/#$HOME/\~}
local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
if [ ${pwdoffset} -gt "0" ]
then
    NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
    NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

bash_prompt() {
local NONE="\[\033[0m\]"    # unsets color to term's fg color

# regular colors
local K="\[\033[0;30m\]"    # black
local R="\[\033[0;31m\]"    # red
local G="\[\033[0;32m\]"    # green
local Y="\[\033[0;33m\]"    # yellow
local B="\[\033[0;34m\]"    # blue
local M="\[\033[0;35m\]"    # magenta
local C="\[\033[0;36m\]"    # cyan
local W="\[\033[0;37m\]"    # white

# empahsized (bolded) colors
local EMK="\[\033[1;30m\]"
local EMR="\[\033[1;31m\]"
local EMG="\[\033[1;32m\]"
local EMY="\[\033[1;33m\]"
local EMB="\[\033[1;34m\]"
local EMM="\[\033[1;35m\]"
local EMC="\[\033[1;36m\]"
local EMW="\[\033[1;37m\]"

# background colors
local BGK="\[\033[40m\]"
local BGR="\[\033[41m\]"
local BGG="\[\033[42m\]"
local BGY="\[\033[43m\]"
local BGB="\[\033[44m\]"
local BGM="\[\033[45m\]"
local BGC="\[\033[46m\]"
local BGW="\[\033[47m\]"

local UC=$Y                 # user's color
[ $UID -eq "0" ] && UC=$R   # root's color

# without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
# extra backslash in front of \$ to make bash colorize the prompt

#Sasha's Colored Prompt
PS1="${UC}\u@${EMW}\h ${EMB}\${NEW_PWD}${EMK} ${EMY}$(parse_git_branch) ${EMG}$ "
}

export PROMPT_COMMAND="bash_prompt_command;$PROMPT_COMMAND"
bash_prompt

#Short prompt
alias short_prompt='export PS1="$ "'

# colorize prompt
# note: for mac need to use macports sudo port install coreutils
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]
then
   eval `dircolors ~/dotfiles/dircolors`
   alias ls="ls --color=auto"
elif [[ "$unamestr" == 'Darwin' ]]
then
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
    alias ls='ls -GFh'
   eval `gdircolors ~/dotfiles/dircolors`
   alias ls="gls --color=auto"
fi

