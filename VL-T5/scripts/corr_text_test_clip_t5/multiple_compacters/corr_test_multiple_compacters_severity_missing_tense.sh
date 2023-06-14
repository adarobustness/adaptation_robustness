SEVERITY=$2
PORT=$3
GPU_NUMBER=$1


METHOD=to_passive
bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_compacters_${METHOD}_${SEVERITY}_t5.out

METHOD=to_active
bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_compacters_${METHOD}_${SEVERITY}_t5.out

METHOD=to_casual
bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh $((PORT+8)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_compacters_${METHOD}_${SEVERITY}_t5.out

METHOD=to_formal
bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh $((PORT+9)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_compacters_${METHOD}_${SEVERITY}_t5.out
