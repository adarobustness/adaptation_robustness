SEVERITY=$2
PORT=$3
GPU_NUMBER=$1

METHOD=drop_nn
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out

METHOD=drop_vb
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out

METHOD=drop_vb_nn
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT+2)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out

METHOD=drop_rand_one_nn
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out

METHOD=drop_rand_one_vb
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out

METHOD=only_nn
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out

METHOD=only_vb
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out

METHOD=only_vb_nn
bash original_scripts/image_clip_bart_corr_hp/single_prompt_len_20.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_prompt_len_20_${METHOD}_${SEVERITY}.out



