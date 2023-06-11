task=multitask

# or bart
#model="bart"
model="t5"

echo $model

if [ $model == "t5" ]
then
    folder_prefix="VLT5"
    backbone="t5-base"
    batch_size=250
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

hypercomplex_division=2
CORRUPTION_METHOD=$3
SEVERITY=$5
RATIO=$9
name=corr_test_4tasks_single_compacter_subset_ratio_${RATIO}_${CORRUPTION_METHOD}_${SEVERITY}
output=snap/${folder_prefix}_${task}/$name
LOAD_MODEL_FROM="./snap/VLT5_multitask/single_compacter_adapt_ratio_${RATIO}/LAST"
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
    --use_single_adapter \
    --use_tasks_prompts \
    --hypercomplex_division ${hypercomplex_division} \
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
