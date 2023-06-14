SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
METHOD=drop_first
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+16)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_last
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+17)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_first_and_last
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+18)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=shuffle_order
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out


METHOD=random_word_delete
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+20)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out


METHOD=mlm_suggestion
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+21)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out



METHOD=swap_syn_word_emb
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+22)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out



METHOD=swap_syn_word_net
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+23)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out

#
#METHOD=swap_multi_pos_jj
#bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+19)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out
#
#
#METHOD=swap_multi_pos_nn
#bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+19)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=back_trans
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+24)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out

METHOD=random_word_swap
bash original_scripts/image_clip_t5_corr_test/multiple_lora.sh $((PORT+25)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_t5.out



