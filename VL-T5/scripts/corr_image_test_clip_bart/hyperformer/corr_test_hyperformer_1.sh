SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
METHOD=motion_blur
bash original_scripts/image_clip_bart_corr_test/hyperformer.sh $((PORT+6)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_${METHOD}_${SEVERITY}.out

METHOD=zoom_blur
bash original_scripts/image_clip_bart_corr_test/hyperformer.sh $((PORT+7)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_${METHOD}_${SEVERITY}.out

METHOD=gaussian_blur
bash original_scripts/image_clip_bart_corr_test/hyperformer.sh $((PORT+8)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_${METHOD}_${SEVERITY}.out

METHOD=snow
bash original_scripts/image_clip_bart_corr_test/hyperformer.sh $((PORT+9)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_${METHOD}_${SEVERITY}.out

METHOD=frost
bash original_scripts/image_clip_bart_corr_test/hyperformer.sh $((PORT+50)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_hyperformer_${METHOD}_${SEVERITY}.out



