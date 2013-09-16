# Useful script for command-line bioinformatics

# given a series of numbers, compute their N50
function N50 () {
perl -ne 'chomp(); push(@contigs,$_);$total+=$_;END{foreach(sort{$b<=>$a}@contigs){$sum+=$_;$L=$_;if($sum>=$total*0.5){print "TOTAL: $total\nN50 : $L\n";exit;} ;}}' 
}
