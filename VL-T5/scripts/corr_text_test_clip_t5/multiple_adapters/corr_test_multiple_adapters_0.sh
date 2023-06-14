SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT)) \
#  --text_corruption_method none \
#  --text_corruption_severity 1 \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_adapters_none_1_t5.out

# try out
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh 26787 \
#  --text_corruption_method gaussian_noise \
#  --text_corruption_severity 5 \
#  --gpu_number 2
#
#METHOD=ocr
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+1)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out
##
##METHOD=swap_prefix
##bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+2)) \
##  --text_corruption_method ${METHOD} \
##  --text_corruption_severity ${SEVERITY} \
##  --gpu_number ${GPU_NUMBER} \
##  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out
#
#METHOD=punctuation
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+3)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out

METHOD=typos
bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out

METHOD=keyboard
bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out
#
#METHOD=spell_error
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out
#
#
#METHOD=random_char_delete
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out
#
#
#METHOD=random_char_insert
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out
#
#
#METHOD=random_char_replace
#bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out
#

METHOD=random_char_swap
bash original_scripts/image_clip_t5_corr_test/multiple_adapters.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_multiple_adapters_${METHOD}_${SEVERITY}_t5.out



