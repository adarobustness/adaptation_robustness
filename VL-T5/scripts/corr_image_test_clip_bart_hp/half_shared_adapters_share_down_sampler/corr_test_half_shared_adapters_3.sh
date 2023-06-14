SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
METHOD=jpeg_compression
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+16)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out

METHOD=speckle_noise
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+17)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out


METHOD=spatter
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+18)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out

METHOD=saturate
bash original_scripts/image_clip_bart_corr_hp/half_shared_adapters_share_down_sampler.sh $((PORT+19)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_images_half_shared_adapters_share_down_sampler_${METHOD}_${SEVERITY}.out



