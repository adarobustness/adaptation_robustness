SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
METHOD=speckle_noise
nohup bash  original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number 4 \
  &> test_on_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}_t5.out 2>&1 &


#METHOD=spatter
#nohup bash  original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 5 \
#  &> test_on_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}_t5.out 2>&1 &



