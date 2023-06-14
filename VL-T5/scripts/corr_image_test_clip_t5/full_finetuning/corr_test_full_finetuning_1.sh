SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
#bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT)) \
#  --img_corruption_method none \
#  --img_corruption_severity 1 \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_images_full_finetuning_none_1_t5.out

METHOD=motion_blur
bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+6)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out

METHOD=zoom_blur
bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+7)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out

METHOD=gaussian_blur
bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+8)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out

METHOD=snow
bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+9)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out

METHOD=frost
bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+10)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out



