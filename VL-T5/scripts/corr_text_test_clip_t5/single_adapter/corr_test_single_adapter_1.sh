SEVERITY=$2
PORT=$3
GPU_NUMBER=$1


#bash original_scripts/image_clip_t5_corr_test/single_adapter.sh 21787 \
#  --text_corruption_method ocr \
#  --text_corruption_severity 5 \
#  --gpu_number 0
#METHOD=to_passive
#bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+6)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out
#
#METHOD=to_active
#bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+7)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out
#
#METHOD=to_casual
#bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+8)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out
#
#METHOD=to_formal
#bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+9)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out

METHOD=tense
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out



METHOD=double_denial
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out


METHOD=insert_adv
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_adapter_${METHOD}_${SEVERITY}_t5.out


METHOD=append_irr
bash original_scripts/image_clip_t5_corr_test/single_adapter.sh $((PORT+10)) \
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
