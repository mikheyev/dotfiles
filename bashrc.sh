# Load dotfiles

# Load ssh-agent, and configure for github
eval `ssh-agent`
alias gitadd='ssh-add ~/.ssh/id_rsa_github'

####################
# History settings #
####################
#append history to make it sharable across instances
shopt -s histappend  
#share history across login instances
set PROMPT_COMMAND='history -a'  
#extend history
export HISTSIZE=10000

# initialize tombo-specific PATH
if [[ "$HOSTNAME" == *tombo* ]]
then
    source ~/dotfiles/tombo_path.sh
fi

# Make a nice prompt
source ~/dotfiles/prompt.sh

# Load bioinformatics shortcuts

source ~/dotfiles/bioinformatic_functions.sh

# make aliases auto-complete
source ~/dotfiles/autocomplete.sh

