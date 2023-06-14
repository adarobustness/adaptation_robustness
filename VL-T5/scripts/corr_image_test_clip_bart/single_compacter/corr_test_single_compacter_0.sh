SEVERITY=$2

PORT=$3
GPU_NUMBER=$1
#METHOD=gaussian_noise
#bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+1)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}.out

METHOD=shot_noise
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}.out

METHOD=impulse_noise
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh 27886 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 2

METHOD=impulse_noise
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}.out

#METHOD=defocus_blur
#bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+4)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}.out

METHOD=glass_blur
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_single_compacter_${METHOD}_${SEVERITY}.out



