SEVERITY=$2

PORT=$3
GPU_NUMBER=$1

#bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh 26787 \
#  --img_corruption_method gaussian_noise \
#  --img_corruption_severity 1 \
#  --gpu_number 0 \
#  &> test_on_corrupted_images_multiple_adapters_none_1.out

METHOD=gaussian_noise
bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}.out

METHOD=shot_noise
bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}.out

METHOD=impulse_noise
bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}.out

METHOD=defocus_blur
bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh $((PORT+4)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}.out

METHOD=glass_blur
bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}.out



