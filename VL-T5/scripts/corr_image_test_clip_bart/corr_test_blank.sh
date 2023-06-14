# blank corr test
SEVERITY=1
PORT=$3
METHOD=blank_image

nohup bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+1)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number 0 \
  &> test_on_blank_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_bart.out 2>&1 &
#
#nohup bash original_scripts/image_clip_bart_corr_test/half_shared_adapters.sh $((PORT+2)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 0 \
#  &> test_on_blank_corrupted_images_half_shared_adapters_${METHOD}_${SEVERITY}_bart.out 2>&1 &

#nohup bash original_scripts/image_clip_bart_corr_test/hyperformer.sh $((PORT+3)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 7 \
#  &> test_on_blank_corrupted_images_hyperformer_${METHOD}_${SEVERITY}_bart.out 2>&1 &

#nohup bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh $((PORT+4)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 1 \
#  &> test_on_blank_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}_bart.out 2>&1 &

#nohup bash original_scripts/image_clip_bart_corr_test/single_adapter.sh $((PORT+5)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 1 \
#  &> test_on_blank_corrupted_images_single_adapter_${METHOD}_${SEVERITY}_bart.out 2>&1 &

#nohup bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+6)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 1 \
#  &> test_on_blank_corrupted_images_single_compacter_${METHOD}_${SEVERITY}_bart.out 2>&1 &

#nohup bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh $((PORT+7)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 2 \
#  &> test_on_blank_corrupted_images_multiple_compacters_${METHOD}_${SEVERITY}_bart.out 2>&1 &

#nohup bash original_scripts/image_clip_bart_corr_test/single_lora.sh $((PORT+8)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 2 \
#  &> test_on_blank_corrupted_images_single_lora_${METHOD}_${SEVERITY}_bart.out 2>&1 &

#nohup bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh $((PORT+9)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 2 \
#  &> test_on_blank_corrupted_images_multiple_lora_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/single_prompt.sh 21787 \
  --img_corruption_method blank_image \
  --img_corruption_severity 1 \
  --gpu_number 3 \
  &> test_on_blank_corrupted_images_single_prompt_${METHOD}_${SEVERITY}_bart.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh $((PORT+11)) \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number 3 \
  &> test_on_blank_corrupted_images_multiple_prompts_${METHOD}_${SEVERITY}_bart.out 2>&1 &

##################################

#nohup bash original_scripts/image_clip_t5_corr_test/full_finetuning.sh $((PORT+1)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 4 \
#  &> test_on_blank_corrupted_images_full_finetuning_${METHOD}_${SEVERITY}_t5.out 2>&1 &

#nohup bash original_scripts/image_clip_t5_corr_test/hyperformer.sh $((PORT+12)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 5 \
#  &> test_on_blank_corrupted_images_hyperformer_${METHOD}_${SEVERITY}_t5.out 2>&1 &

#nohup bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+13)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 5 \
#  &> test_on_blank_corrupted_images_multiple_adapters_${METHOD}_${SEVERITY}_t5.out 2>&1 &

#nohup bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+14)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 6 \
#  &> test_on_blank_corrupted_images_single_adapter_${METHOD}_${SEVERITY}_t5.out 2>&1 &

#nohup bash original_scripts/image_clip_t5_corr_test/single_compacter.sh $((PORT+15)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 6 \
#  &> test_on_blank_corrupted_images_single_compacter_${METHOD}_${SEVERITY}_t5.out 2>&1 &

#nohup bash original_scripts/image_clip_t5_corr_test/multiple_compacters.sh $((PORT+16)) \
#  --img_corruption_method ${METHOD} \
#  --img_corruption_severity ${SEVERITY} \
#  --gpu_number 7 \
#  &> test_on_blank_corrupted_images_multiple_compacters_${METHOD}_${SEVERITY}_t5.out 2>&1 &
