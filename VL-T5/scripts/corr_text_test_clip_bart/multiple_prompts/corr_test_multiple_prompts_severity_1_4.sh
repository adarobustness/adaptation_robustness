SEVERITY=$2
PORT=$3
GPU_NUMBER=$1


METHOD=ocr
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out

METHOD=punctuation
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out

METHOD=typos_corruption
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out

METHOD=keyboard_corruption
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out

METHOD=spell_error
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out


METHOD=random_char_delete
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out


METHOD=random_char_insert
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out


METHOD=random_char_replace
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out


METHOD=random_char_swap
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out

METHOD=random_word_insert
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out



METHOD=random_word_delete
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out

METHOD=swap_syn_word_emb
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out



METHOD=swap_syn_word_net
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out

METHOD=random_word_swap
bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}.out
