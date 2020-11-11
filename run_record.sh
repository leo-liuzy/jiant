#!/usr/bin/env bash


batch_size=32
epoch=2
pretrain_output_dir="../dynamic_during_pretraining/output"
scenario=${1}
model_dir=mlm+${scenario}/roberta_bz256_save${2}

task=record

for chk in ${3}
do
python jiant/proj/simple/runscript_dynamic.py \
                run \
                --run_name simple \
                --exp_dir output \
                --chkpt_exp_dir ${task}/${model_dir}/checkpoint_${chk} \
                --data_dir data \
                --model_cache_path ${pretrain_output_dir}/${model_dir}/checkpoint_${chk} \
                --model_type roberta-base \
                --tasks ${task} \
                --train_batch_size ${batch_size} \
                --num_train_epoch ${epoch}
done