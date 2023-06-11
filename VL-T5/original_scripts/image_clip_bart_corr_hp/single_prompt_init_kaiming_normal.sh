task=multitask

# or bart
model="bart"

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

feature=RN101

CORRUPTION_METHOD=$3
SEVERITY=$5
LOAD_MODEL_FROM="./snap/VLBart_multitask/single_prompt_hp_init_kaiming_normal/LAST"
lr=1e-3
name=corr_test_4tasks_single_prompt_init_kaiming_normal_${CORRUPTION_METHOD}_${SEVERITY}
output=snap/${folder_prefix}_${task}/$name

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
    --epochs 1 \
    --num_workers 4 \
    --backbone ${backbone} \
    --output $output ${@:2} \
    --num_beams 5 \
    --batch_size ${batch_size} \
    --valid_batch_size ${batch_size} \
    --encoder_prompt_len 40 \
    --mid_dim 800 \
    --use_single_prompt \
    --use_tasks_prompts \
    --tasks "vqa,gqa,nlvr,caption" \
    --feature ${feature} --n_boxes 36 --downsample \
    --image_size "(224,224)" \
    --run_name $name \
    --comment "test corr" \
    --load $LOAD_MODEL_FROM \
    --to_test True \
    --to_train False \
    --encoder_prompt_init_method kaiming_normal


