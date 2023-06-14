SEVERITY=$2

PORT=$3
GPU_NUMBER=$1

METHOD=impulse_noise
nohup bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number $((GPU_NUMBER)) \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}.out 2>&1 &

METHOD=defocus_blur
nohup bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh $((PORT+4)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number $((GPU_NUMBER+1)) \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}.out 2>&1 &

METHOD=contrast
nohup bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh $((PORT+13)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number $((GPU_NUMBER+2)) \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}.out 2>&1 &

METHOD=gaussian_blur
nohup bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh $((PORT+8)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number $((GPU_NUMBER+3)) \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}.out 2>&1 &

METHOD=spatter
nohup bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh $((PORT+18)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number $((GPU_NUMBER+4)) \
  &> test_on_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}.out 2>&1 &


