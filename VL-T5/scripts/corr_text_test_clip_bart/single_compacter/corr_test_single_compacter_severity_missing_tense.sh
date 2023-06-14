SEVERITY=$2
PORT=$3
GPU_NUMBER=$1

METHOD=typos
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_compacter_${METHOD}_${SEVERITY}.out

METHOD=keyboard
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_single_compacter_${METHOD}_${SEVERITY}.out

#
#METHOD=to_passive
#bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+6)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_compacter_${METHOD}_${SEVERITY}.out
#
#METHOD=to_active
#bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+7)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_compacter_${METHOD}_${SEVERITY}.out
#
#METHOD=to_casual
#bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+8)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_compacter_${METHOD}_${SEVERITY}.out
#
#METHOD=to_formal
#bash original_scripts/image_clip_bart_corr_test/single_compacter.sh $((PORT+9)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_single_compacter_${METHOD}_${SEVERITY}.out
