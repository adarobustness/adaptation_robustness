task=multitask

# or bart
model="t5"

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

lora_dim=128

name=reproduce_1gpu_4tasks_multiple_lora
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
    --use_lora \
    --lora_dim ${lora_dim} \
    --batch_size ${batch_size} \
    --valid_batch_size ${batch_size} \
    --tasks "vqa,gqa,nlvr,caption" \
    --feature ${feature} --n_boxes 36 --downsample \
    --image_size "(224,224)" \
    --run_name $name
