# Load dotfiles

# Load ssh-agent
eval `ssh-agent`

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

