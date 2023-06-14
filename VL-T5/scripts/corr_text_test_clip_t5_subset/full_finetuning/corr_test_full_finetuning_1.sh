SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
RATIO=$4

#bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh 21787 \
#  --text_corruption_method ocr \
#  --text_corruption_severity 5 \
#  --gpu_number 0
METHOD=to_passive
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=to_active
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=to_casual
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+2)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=to_formal
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=tense
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out



METHOD=double_denial
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out


METHOD=insert_adv
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out


METHOD=append_irr
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=random_word_insert
bash original_scripts/image_clip_t5_corr_subset/full_finetuning.sh $((PORT+8)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}_t5.out
