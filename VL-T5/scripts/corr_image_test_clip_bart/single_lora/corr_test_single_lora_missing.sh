SEVERITY=$2
METHOD=gaussian_noise
PORT=$3
nohup bash original_scripts/image_clip_bart_corr_test/single_lora.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number 5 \
  &> test_on_corrupted_images_single_lora_${METHOD}_${SEVERITY}.out 2>&1 &

METHOD=shot_noise
nohup bash original_scripts/image_clip_bart_corr_test/single_lora.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number 6 \
  &> test_on_corrupted_images_single_lora_${METHOD}_${SEVERITY}.out 2>&1 &

METHOD=defocus_blur
nohup bash original_scripts/image_clip_bart_corr_test/single_lora.sh $((PORT+4)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number 7 \
  &> test_on_corrupted_images_single_lora_${METHOD}_${SEVERITY}.out 2>&1 &

