SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
METHOD=drop_nn
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+11)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_vb
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+12)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_vb_nn
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+13)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_rand_one_nn
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+14)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_rand_one_vb
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+15)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=only_nn
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+18)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=only_vb
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+17)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=only_vb_nn
bash original_scripts/image_clip_t5_corr_test/single_lora.sh $((PORT+16)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_lora_${METHOD}_${SEVERITY}_t5.out



