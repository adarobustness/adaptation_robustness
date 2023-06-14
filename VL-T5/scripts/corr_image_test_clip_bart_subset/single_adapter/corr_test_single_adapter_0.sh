SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
RATIO=$4

bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh $((PORT)) \
  --img_corruption_method none \
  --img_corruption_severity 5 \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_adapter_${RATIO}_none_5.out

# try out
#bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26787 \
#  --img_corruption_method gaussian_noise \
#  --img_corruption_severity 5 \
#  --gpu_number 2 \
#  --subset_ratio 0.8

METHOD=gaussian_noise
bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_adapter_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=shot_noise
bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_adapter_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=impulse_noise
bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
    --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_adapter_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=defocus_blur
bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh $((PORT+4)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_adapter_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=glass_blur
bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_adapter_${RATIO}_${METHOD}_${SEVERITY}.out



