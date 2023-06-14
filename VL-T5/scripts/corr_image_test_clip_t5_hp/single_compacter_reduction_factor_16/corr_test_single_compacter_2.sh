SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
METHOD=fog
bash original_scripts/image_clip_t5_corr_hp/single_compacter_reduction_factor_16.sh $((PORT+11)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=brightness
bash original_scripts/image_clip_t5_corr_hp/single_compacter_reduction_factor_16.sh $((PORT+16)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=contrast
bash original_scripts/image_clip_t5_corr_hp/single_compacter_reduction_factor_16.sh $((PORT+13)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=elastic_transform
bash original_scripts/image_clip_t5_corr_hp/single_compacter_reduction_factor_16.sh $((PORT+14)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=pixelate
bash original_scripts/image_clip_t5_corr_hp/single_compacter_reduction_factor_16.sh $((PORT+15)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_16_${METHOD}_${SEVERITY}.out



