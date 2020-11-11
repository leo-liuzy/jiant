#!/bin/bash
#SBATCH --job-name=record+all+step
#SBATCH --chdir=/gscratch/cse/yizhongw/leo/jiant/

#SBATCH --output=/gscratch/cse/yizhongw/leo/jiant/slurmout/%j.out
#SBATCH --error=/gscratch/cse/yizhongw/leo/jiant/slurmout/%j.err
## Allocation Definition
## The account and partition options should be the same except in a few cases (e.g. ckpt queue and genpool queue).
#SBATCH --account=h2lab
#SBATCH --partition=h2lab-gpu
#SBATCH --nodelist=n2549
## Resources
## Total number of Nodes
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
## Number of cores per node
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
## Walltime (3 hours). Do not specify a walltime substantially more than your job needs.
#SBATCH --time=50:00:00
## Memory per node. It is important to specify the memory since the default memory is very small.
## For mox, --mem may be more than 100G depending on the memory of your nodes.
## For ikt, --mem may be 58G or more depending on the memory of your nodes.
## See above section on "Specifying memory" for choices for --mem.
#SBATCH --mem=50G
## Specify the working directory for this job
##turn on e-mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=zeyuliu2@cs.washington.edu
## export all your environment variables to the batch job session
#SBATCH --export=all
## conda init bash


# dataset=three
# task=SST-2
# for chkpt in 
# "980000 960000 940000 920000 900000 880000 860000 840000 820000 800000 80000 800 780000 760000 740000 720000" "700000 680000 660000 640000 6400 620000 600000 60000 580000 560000 540000 520000 500000 480000 460000 440000" "420000 400000 40000 400 40 4 380000 360000 340000 320000 3200 300000 3 280000 260000 240000 220000" "200000 20000 200 20 2 180000 160000 1600 140000 12800 120000 1000000 100000 100 10 1 0"

dataset=all
dir=steps
for chkpt in "1000000" "640000"
# "320000 160000 80000 40000 20000 6400 3200 0"
do
     bash run_wsc.sh ${dataset} ${dir} "${chkpt}" & # > slurmout/${task}-${dataset}-${dir}-"${chkpt}".slurm
done

wait


