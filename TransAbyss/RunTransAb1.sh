#PBS -N TransAb1
#PBS -m bea
#PBS -M 
#PBS -l nodes=1:ppn=10,walltime=12:00:00,vmem=100gb

#set wd
cd PWDHERE/TransAbyss

source ../setup_files/kmers 

module load transabyss/2.0.1
module load igraph/python/0.7.1
module load blat

#run
reads1=PWDHERE/input_files/left-norm.fq
reads2=PWDHERE/input_files/right-norm.fq

OD=`pwd`

transabyss -k $k1 --pe $reads1 $reads2 --outdir $OD --name $k1.transabyss.fa --threads 4 -c 12 &
transabyss -k $k2 --pe $reads1 $reads2 --outdir $OD --name $k2.transabyss.fa --threads 4 -c 12 &
transabyss -k $k3 --pe $reads1 $reads2 --outdir $OD --name $k3.transabyss.fa --threads 4 -c 12 &

wait
