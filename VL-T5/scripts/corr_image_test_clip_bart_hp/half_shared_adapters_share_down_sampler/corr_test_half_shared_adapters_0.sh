SEVERITY=$2

PORT=$3
GPU_NUMBER=$1

bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT)) \
  --img_corruption_method none \
  --img_corruption_severity 5 \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_none_5.out


METHOD=gaussian_noise
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out

METHOD=shot_noise
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+2)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out

METHOD=impulse_noise
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+3)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out

METHOD=defocus_blur
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+4)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out

METHOD=glass_blur
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+5)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out



