#! /usr/bin/bash

task=multitask

# t5 or bart
model="bart"
echo $model

if [ $model == "t5" ]
then
    folder_prefix="VLT5"
    backbone="t5-base"
    batch_size=300
elif [ $model == "bart" ]
then
    folder_prefix="VLBart"
    backbone="facebook/bart-base"
    batch_size=500
fi

echo $folder_prefix
echo $backbone

feature=RN101

lr=1e-3
RF=$5
name=single_adapter_hp_reduction_factor_$RF
#name=reproduce_4tasks_1gpu_single_adapter
echo $name

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
    --num_workers 4 \
    --backbone ${backbone} \
    --output $output ${@:2} \
    --num_beams 5 \
    --batch_size ${batch_size} \
    --valid_batch_size ${batch_size} \
    --use_adapter \
    --unfreeze_layer_norms \
    --use_single_adapter \
    --use_tasks_prompts \
    --tasks "vqa,gqa,nlvr,caption" \
    --feature ${feature} --n_boxes 36 --downsample \
    --image_size "(224,224)" \

# --reduction_factor 8 \
