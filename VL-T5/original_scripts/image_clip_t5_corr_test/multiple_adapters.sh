#! /usr/bin/bash
task=multitask

model="t5"
echo $model

batch_size=250
folder_prefix="VLT5"
backbone="t5-base"
echo $folder_prefix
echo $backbone
CORRUPTION_METHOD=$3
SEVERITY=$5
feature=RN101

lr=1e-3
name=corr_test_4tasks_multiple_adapters_${CORRUPTION_METHOD}_${SEVERITY}
output=snap/${folder_prefix}_${task}/$name
LOAD_MODEL_FROM="./snap/VLT5_multitask/reproduce_1gpu_4tasks_multiple_adapters/LAST"
TOKENIZERS_PARALLELISM=True PYTHONPATH=$PYTHONPATH:./src \
CUDA_VISIBLE_DEVICES=$7 python -m torch.distributed.launch \
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
    --use_adapter \
    --unfreeze_layer_norms \
    --reduction_factor 8 \
    --tasks "vqa,gqa,nlvr,caption" \
    --feature ${feature} --n_boxes 36 --downsample \
    --image_size "(224,224)" \
    --run_name $name \
    --load $LOAD_MODEL_FROM \
    --comment "test on corr data" \
    --run_name $name \
    --to_test True \
    --to_train False


