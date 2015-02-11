# Useful script for command-line bioinformatics

# given a series of numbers, compute their N50
function N50 () {
perl -ne 'chomp(); push(@contigs,$_);$total+=$_;END{foreach(sort{$b<=>$a}@contigs){$sum+=$_;$L=$_;if($sum>=$total*0.5){print "TOTAL: $total\nN50 : $L\n";exit;} ;}}' 
}

<<<<<<< HEAD
# call bc from the command line, automatically loading math libraries
function calc () { 
	echo "scale=4; "$@ | bc
}

=======
function mean_sd () {
awk '{x[NR]=$0; s+=$0; n++} END{a=s/n; for (i in x){ss += (x[i]-a)^2} sd = sqrt(ss/n); print "total = "s", mean = "s/n ", SD = "sd}'
}

#compute mean and sd from a list of number from stdin
>>>>>>> 1c4642d4cf8b468609ae2f939b20d0036ea61975

# 

# initialize tombo-specific aliases
if [[ "$HOSTNAME" == *tombo-login* ]]
then
# Load ssh-agent, and configure for github
alias GATK="java -jar /apps/MikheyevU/sasha/GenomeAnalysisTK-2.3-4-g57ea19f/GenomeAnalysisTK.jar"
alias qqsub="qsub -j y -cwd -q short -l h_vmem=4G -l virtual_free=4G <<< '. $HOME/.bashrc; "
alias qlsub="qsub -j y -cwd -q long -l h_vmem=4G -l virtual_free=4G <<< '. $HOME/.bashrc; "
alias qgsub="qsub -j y -cwd -q genomics -l h_vmem=20G -l virtual_free=20G <<< '. $HOME/.bashrc; "
alias readseq="java -jar /apps/MikheyevU/scripts/readseq.jar"
fi

