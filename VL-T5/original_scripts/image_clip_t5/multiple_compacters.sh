task=multitask

# or bart
#model="bart"
model="t5"
folder_prefix="VLT5"
backbone="t5-base"
batch_size=250
echo $model
echo $folder_prefix
echo $backbone

feature=RN101

lr=1e-3

hypercomplex_division=2
TOP_K=$5
name=multiple_compacters_adapt_ratio_${TOP_K}
echo $name

#name=reproduce_1gpu_4tasks_multiple_compacters
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
    --use_compacter \
    --shared_phm_rule False \
    --factorized_phm False \
    --unfreeze_layer_norms \
    --hypercomplex_division ${hypercomplex_division} \
    --reduction_factor 8 \
    --tasks "vqa,gqa,nlvr,caption" \
    --feature ${feature} --n_boxes 36 --downsample \
    --image_size "(224,224)" \
    --run_name $name
