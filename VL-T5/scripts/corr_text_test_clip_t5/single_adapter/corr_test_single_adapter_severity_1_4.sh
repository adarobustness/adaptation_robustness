SEVERITY=$2
PORT=$3
GPU_NUMBER=$1


METHOD=ocr
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=punctuation
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=typos_corruption
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=keyboard_corruption
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=spell_error
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out


METHOD=random_char_delete
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out


METHOD=random_char_insert
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out


METHOD=random_char_replace
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out


METHOD=random_char_swap
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=random_word_insert
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out



METHOD=random_word_delete
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=swap_syn_word_emb
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out



METHOD=swap_syn_word_net
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=random_word_swap
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out
