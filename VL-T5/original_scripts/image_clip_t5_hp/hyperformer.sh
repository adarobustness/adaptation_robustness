#! /usr/bin/bash

task=multitask
model="t5"
echo $model
batch_size=250
folder_prefix="VLT5"
backbone="t5-base"
echo $folder_prefix
echo $backbone

feature=RN101

lr=1e-3

projected_task_embedding_dim=8

RF=$5
name=hyperformer_hp_reduction_factor_${RF}
echo $name
#name=reproduce_1gpu_4tasks_hyperformer
output=snap/${folder_prefix}_${task}/$name

TOKENIZERS_PARALLELISM=True PYTHONPATH=$PYTHONPATH:./src \
CUDA_VISIBLE_DEVICES=$3 python -m torch.distributed.launch \
    --nproc_per_node=1 \
    --master_port=$1 \
    src/${task}.py \
    --distributed --multiGPU \
    --optim adamw \
    --warmup_ratio 0.1 \
    --clip_grad_norm 5 \
    --lr ${lr} \
    --epochs 20 \
    --num_workers 10 \
    --backbone ${backbone} \
    --output $output ${@:2} \
    --num_beams 5 \
    --batch_size ${batch_size} \
    --valid_batch_size ${batch_size} \
    --use_hyperformer \
    --unique_hyper_net \
    --unfreeze_layer_norms \
    --projected_task_embedding_dim ${projected_task_embedding_dim} \
    --tasks "vqa,gqa,nlvr,caption" \
    --feature ${feature} --n_boxes 36 --downsample \
    --image_size "(224,224)" \
    --run_name $name

#--reduction_factor 8 \