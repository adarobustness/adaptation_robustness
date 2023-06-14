METHOD=back_trans
PORT=21000
nohup bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity 5 \
  --gpu_number 0 \
  > test_on_corrupted_text_multiple_prompts_init_xavier_uniform_${METHOD}_${SEVERITY}.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_hp/single_prompt_init_uniform.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity 5 \
  --gpu_number 1 \
  > test_on_corrupted_text_single_prompt_init_uniform_${METHOD}_${SEVERITY}.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_hp/single_prompt_position_middle.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity 5 \
  --gpu_number 5 \
  > test_on_corrupted_text_single_prompt_position_middle_${METHOD}_${SEVERITY}.out 2>&1 &
