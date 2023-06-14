SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
RATIO=$4

bash original_scripts/image_clip_bart_corr_subset/single_lora.sh $((PORT)) \
  --img_corruption_method none \
  --img_corruption_severity 5 \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_lora_${RATIO}_none_5.out

# try out
#bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26787 \
#  --img_corruption_method gaussian_noise \
#  --img_corruption_severity 5 \
#  --gpu_number 2 \
#  --subset_ratio 0.8

METHOD=gaussian_noise
bash original_scripts/image_clip_bart_corr_subset/single_lora.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_lora_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=shot_noise
bash original_scripts/image_clip_bart_corr_subset/single_lora.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_lora_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=impulse_noise
bash original_scripts/image_clip_bart_corr_subset/single_lora.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
    --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_lora_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=defocus_blur
bash original_scripts/image_clip_bart_corr_subset/single_lora.sh $((PORT+4)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_lora_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=glass_blur
bash original_scripts/image_clip_bart_corr_subset/single_lora.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_images_single_lora_${RATIO}_${METHOD}_${SEVERITY}.out



METHOD=pixelate
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26000 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 0 \
  --subset_ratio 0.2 \
  > test_on_corrupted_images_single_lora_0.2_${METHOD}_5.out 2>&1 &

METHOD=pixelate
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26001 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 1 \
  --subset_ratio 0.4 \
  > test_on_corrupted_images_single_lora_0.4_${METHOD}_5.out 2>&1 &

METHOD=pixelate
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26002 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 2 \
  --subset_ratio 0.6 \
  > test_on_corrupted_images_single_lora_0.6_${METHOD}_5.out 2>&1 &

METHOD=pixelate
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26003 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 3 \
  --subset_ratio 0.8 \
  > test_on_corrupted_images_single_lora_0.8_${METHOD}_5.out 2>&1 &

METHOD=frost
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26004 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 0 \
  --subset_ratio 0.2 \
  > test_on_corrupted_images_single_lora_0.2_${METHOD}_5.out 2>&1 &

METHOD=frost
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26005 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 1 \
  --subset_ratio 0.4 \
  > test_on_corrupted_images_single_lora_0.4_${METHOD}_5.out 2>&1 &

METHOD=snow
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26008 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 1 \
  --subset_ratio 0.4 \
  > test_on_corrupted_images_single_lora_0.4_${METHOD}_5.out 2>&1 &

METHOD=frost
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26006 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 2 \
  --subset_ratio 0.6 \
  > test_on_corrupted_images_single_lora_0.6_${METHOD}_5.out 2>&1 &

METHOD=frost
nohup bash original_scripts/image_clip_bart_corr_subset/single_lora.sh 26007 \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity 5 \
  --gpu_number 3 \
  --subset_ratio 0.8 \
  > test_on_corrupted_images_single_lora_0.8_${METHOD}_5.out 2>&1 &

