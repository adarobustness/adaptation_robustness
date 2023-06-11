task=multitask

# or bart
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
CORRUPTION_METHOD=$3
SEVERITY=$5
lr=3e-4
name=corr_test_4tasks_multiple_adapters_${CORRUPTION_METHOD}_${SEVERITY}
output=snap/${folder_prefix}_${task}/$name

#BASE_DIR="/dss/dssmcmlfs01/pn69za/pn69za-dss-0002/ra75gan2/robustness/VL_adapter/VL-T5/snap/VLBart_multitask"
BASE_DIR="./snap/VLBart_multitask"

LOAD_MODEL_FROM=${BASE_DIR}"/reproduce_1gpu_4tasks_multiple_adapters/LAST"
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
