SEVERITY=$2
PORT=$3
GPU_NUMBER=$1


#bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh 21787 \
#  --text_corruption_method ocr \
#  --text_corruption_severity 5 \
#  --gpu_number 0
#METHOD=to_passive
#bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+6)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out
#
#METHOD=to_active
#bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+7)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out
#
#METHOD=to_casual
#bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+8)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out
#
#METHOD=to_formal
#bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+9)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out

METHOD=tense
bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out



METHOD=double_denial
bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out


METHOD=insert_adv
bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out


METHOD=append_irr
bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out

METHOD=random_word_insert
bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh $((PORT+10)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  &> test_on_corrupted_text_full_finetuning_${METHOD}_${SEVERITY}.out
