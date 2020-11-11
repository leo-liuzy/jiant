#!/usr/bin/env bash


batch_size=32
epoch=2
pretrain_output_dir="../dynamic_during_pretraining/output"
scenario=${1}
model_dir=mlm+${scenario}/roberta_bz256_savesteps
chk=1000000

python jiant/proj/simple/runscript.py \
                run \
                --run_name simple \
                --exp_dir output \
                --data_dir data \
                --model_cache_path ${pretrain_output_dir}/${model_dir}/checkpoint-${chk} \
                --model_type roberta-base \
                --tasks record \
                --train_batch_size ${batch_size} \
                --num_train_epoch ${epoch}