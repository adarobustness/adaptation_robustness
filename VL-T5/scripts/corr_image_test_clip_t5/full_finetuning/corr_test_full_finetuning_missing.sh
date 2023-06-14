SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
#
#METHOD=gaussian_noise
#nohup bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+1)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 0 \
#  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out 2>&1 &
#
#METHOD=motion_blur
#nohup bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+2)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 1 \
#  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out 2>&1 &
#
#METHOD=jpeg_compression
#nohup bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+3)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 2 \
#  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out 2>&1 &
#
#METHOD=fog
#nohup bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+4)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 3 \
#  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out 2>&1 &

METHOD=saturate
nohup bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number 4 \
  &> test_on_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out 2>&1 &



