SEVERITY=$2
PORT=$3
GPU_NUMBER=$1

METHOD=fog
bash original_scripts/image_clip_t5_corr_test/multiple_compacters.sh $((PORT+11)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_compacters_${METHOD}_${SEVERITY}_t5.out

METHOD=brightness
bash original_scripts/image_clip_t5_corr_test/multiple_compacters.sh $((PORT+12)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_compacters_${METHOD}_${SEVERITY}_t5.out

METHOD=contrast
bash original_scripts/image_clip_t5_corr_test/multiple_compacters.sh $((PORT+13)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_compacters_${METHOD}_${SEVERITY}_t5.out

METHOD=elastic_transform
bash original_scripts/image_clip_t5_corr_test/multiple_compacters.sh $((PORT+14)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_compacters_${METHOD}_${SEVERITY}_t5.out

METHOD=pixelate
bash original_scripts/image_clip_t5_corr_test/multiple_compacters.sh $((PORT+15)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_compacters_${METHOD}_${SEVERITY}_t5.out



