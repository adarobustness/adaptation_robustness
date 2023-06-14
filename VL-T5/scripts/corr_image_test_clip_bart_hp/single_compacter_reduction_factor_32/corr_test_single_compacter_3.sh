SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
METHOD=jpeg_compression
bash original_scripts/image_clip_bart_corr_hp/single_compacter_reduction_factor_32.sh $((PORT+32)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_32_${METHOD}_${SEVERITY}.out

METHOD=speckle_noise
bash original_scripts/image_clip_bart_corr_hp/single_compacter_reduction_factor_32.sh $((PORT+17)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_32_${METHOD}_${SEVERITY}.out

METHOD=spatter
bash original_scripts/image_clip_bart_corr_hp/single_compacter_reduction_factor_32.sh $((PORT+18)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_32_${METHOD}_${SEVERITY}.out

METHOD=saturate
bash original_scripts/image_clip_bart_corr_hp/single_compacter_reduction_factor_32.sh $((PORT+19)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_reduction_factor_32_${METHOD}_${SEVERITY}.out



