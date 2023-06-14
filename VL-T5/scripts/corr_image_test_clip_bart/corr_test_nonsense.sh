# nonsense corr test
SEVERITY=5
PORT=21700
METHOD=nonsense

nohup bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 0 \
  &> test_on_nonsense_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/half_shared_adapters.sh $((PORT+2)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 0 \
  &> test_on_nonsense_corrupted_text_half_shared_adapters_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/hyperformer.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 1 \
  &> test_on_nonsense_corrupted_text_hyperformer_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 1 \
  &> test_on_nonsense_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 2\
  &> test_on_nonsense_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 2 \
  &> test_on_nonsense_corrupted_text_single_compacter_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 3 \
  &> test_on_nonsense_corrupted_text_multiple_compacters_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/single_lora.sh $((PORT+8)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 3 \
  &> test_on_nonsense_corrupted_text_single_lora_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh $((PORT+9)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 4 \
  &> test_on_nonsense_corrupted_text_multiple_lora_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/single_prompt.sh 21788 \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY}  \
  --gpu_number 4 \
  &> test_on_nonsense_corrupted_text_single_prompt_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+11)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 5 \
  &> test_on_nonsense_corrupted_text_multiple_prompts_${METHOD}_${SEVERITY}_bart.out 2>&1 &

##################################

nohup bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+19)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 5 \
  &> test_on_nonsense_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}_t5.out 2>&1 &

nohup bash original_scripts/image_clip_t5_corr_test/hyperformer.sh $((PORT+20)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 6 \
  &> test_on_nonsense_corrupted_text_hyperformer_${METHOD}_${SEVERITY}_t5.out 2>&1 &

nohup bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+13)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 6 \
  &> test_on_nonsense_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out 2>&1 &

nohup bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+14)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 7 \
  &> test_on_nonsense_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out 2>&1 &

nohup bash original_scripts/image_clip_t5_corr_test/single_compacter.sh $((PORT+15)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 7 \
  &> test_on_nonsense_corrupted_text_single_compacter_${METHOD}_${SEVERITY}_t5.out 2>&1 &

nohup bash original_scripts/image_clip_t5_corr_test/multiple_compacters.sh $((PORT+16)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number 7 \
  &> test_on_nonsense_corrupted_text_multiple_compacters_${METHOD}_${SEVERITY}_t5.out 2>&1 &
