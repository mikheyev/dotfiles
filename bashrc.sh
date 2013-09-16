
# initialize tombo-specific PATH
if [[ "$HOSTNAME" == *tombo* ]]
then
    source tombo_path
fi

# make aliases auto-complete
source ~/dotfiles/autocomplete.sh


#USEFUL SCRIPTS
function N50 () {
perl -ne 'chomp(); push(@contigs,$_);$total+=$_;END{foreach(sort{$b<=>$a}@contigs){$sum+=$_;$L=$_;if($sum>=$total*0.5){print "TOTAL: $total\nN50 : $L\n";exit;} ;}}' 
}
