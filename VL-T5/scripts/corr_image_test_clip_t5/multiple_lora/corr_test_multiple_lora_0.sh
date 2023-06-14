SEVERITY=$2
METHOD=gaussian_noise
PORT=$3
GPU_NUMBER=$1
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $PORT \
  --img_corruption_method none  \
  --img_corruption_severity 5 \
  --gpu_number 0

bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=shot_noise
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=impulse_noise
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=defocus_blur
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+4)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=glass_blur
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}_t5.out



