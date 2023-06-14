SEVERITY=$2
PORT=$3
GPU_NUMBER=$1

METHOD=drop_nn
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out

METHOD=drop_vb
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out

METHOD=drop_vb_nn
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT+2)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out

METHOD=drop_rand_one_nn
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out

METHOD=drop_rand_one_vb
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out

METHOD=only_nn
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out

METHOD=only_vb
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out

METHOD=only_vb_nn
bash original_scripts/image_clip_bart_corr_hp/multiple_prompts_init_uniform.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_prompts_init_uniform_${METHOD}_${SEVERITY}.out



