#!/usr/bin/env bash


batch_size=32
epoch=2
pretrain_output_dir="../dynamic_during_pretraining/output"
scenario=${1}
model_dir=mlm+${scenario}/roberta_bz256_savesteps
chk=1000000
<<<<<<< HEAD
task=record

python jiant/proj/simple/runscript_dynamic.py \
                run \
                --run_name simple \
                --exp_dir output \
                --chkpt_exp_dir ${task}/${model_dir}/checkpoint_${chk} \
                --data_dir data \
                --model_cache_path ${pretrain_output_dir}/${model_dir}/checkpoint_${chk} \
                --model_type roberta-base \
                --tasks ${task} \
=======

python jiant/proj/simple/runscript.py \
                run \
                --run_name simple \
                --exp_dir output \
                --data_dir data \
                --model_cache_path ${pretrain_output_dir}/${model_dir}/checkpoint-${chk} \
                --model_type roberta-base \
                --tasks record \
>>>>>>> e31c945be23aa29e3d57ea2d7de3dcf4e323645e
                --train_batch_size ${batch_size} \
                --num_train_epoch ${epoch}