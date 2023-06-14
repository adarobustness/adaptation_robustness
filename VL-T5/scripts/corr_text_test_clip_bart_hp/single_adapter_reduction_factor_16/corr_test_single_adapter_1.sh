SEVERITY=$2
PORT=$3
GPU_NUMBER=$1

#bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh 21787 \
#  --text_corruption_method ocr \
#  --text_corruption_severity 5 \
#  --gpu_number 0
METHOD=to_passive
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=to_active
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=to_casual
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+2)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=to_formal
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=tense
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out



METHOD=double_denial
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out


METHOD=insert_adv
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out


METHOD=append_irr
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out

METHOD=random_word_insert
bash original_scripts/image_clip_bart_corr_hp/single_adapter_reduction_factor_16.sh $((PORT+8)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_reduction_factor_16_${METHOD}_${SEVERITY}.out
