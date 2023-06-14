SEVERITY=$2
PORT=$3
GPU_NUMBER=$1

METHOD=jpeg_compression
bash original_scripts/image_clip_t5_corr_test/single_compacter.sh $((PORT+17)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}_t5.out

METHOD=speckle_noise
bash original_scripts/image_clip_t5_corr_test/single_compacter.sh $((PORT+18)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}_t5.out

PORT=21199
METHOD=speckle_noise
GPU_NUMBER=1
SEVERITY=5
bash original_scripts/image_clip_t5_corr_test/single_compacter.sh $((PORT+18)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}_t5.out

METHOD=saturate
bash original_scripts/image_clip_t5_corr_test/single_compacter.sh $((PORT+19)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}_t5.out



