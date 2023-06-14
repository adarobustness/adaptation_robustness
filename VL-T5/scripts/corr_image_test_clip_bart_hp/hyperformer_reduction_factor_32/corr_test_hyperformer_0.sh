SEVERITY=$2
PORT=$3

GPU_NUMBER=$1
bash original_scripts/image_clip_bart_corr_hp/hyperformer_reduction_factor_32.sh $((PORT)) \
  --img_corruption_method none \
  --img_corruption_severity 5 \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_reduction_factor_32_none_5.out

METHOD=gaussian_noise
bash original_scripts/image_clip_bart_corr_hp/hyperformer_reduction_factor_32.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_reduction_factor_32_${METHOD}_${SEVERITY}.out

METHOD=shot_noise
bash original_scripts/image_clip_bart_corr_hp/hyperformer_reduction_factor_32.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_reduction_factor_32_${METHOD}_${SEVERITY}.out

METHOD=impulse_noise
bash original_scripts/image_clip_bart_corr_hp/hyperformer_reduction_factor_32.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_reduction_factor_32_${METHOD}_${SEVERITY}.out

METHOD=defocus_blur
bash original_scripts/image_clip_bart_corr_hp/hyperformer_reduction_factor_32.sh $((PORT+32)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_reduction_factor_32_${METHOD}_${SEVERITY}.out

METHOD=glass_blur
bash original_scripts/image_clip_bart_corr_hp/hyperformer_reduction_factor_32.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_reduction_factor_32_${METHOD}_${SEVERITY}.out



