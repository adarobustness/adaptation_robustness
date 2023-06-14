SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
RATIO=$4

METHOD=drop_first
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=drop_last
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=drop_first_and_last
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+2)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=shuffle_order
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out


METHOD=random_word_delete
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out


#METHOD=mlm_suggestion
#bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+19)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  --subset_ratio ${RATIO} \
#  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out
#


METHOD=swap_syn_word_emb
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out



METHOD=swap_syn_word_net
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out

#
#METHOD=swap_multi_pos_jj
#bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+19)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  --subset_ratio ${RATIO} \
#  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out
#
#
#METHOD=swap_multi_pos_nn
#bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+19)) \
#  --text_corruption_method ${METHOD} \
#  --text_corruption_severity ${SEVERITY} \
#  --gpu_number ${GPU_NUMBER} \
#  --subset_ratio ${RATIO} \
#  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=back_trans
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out

METHOD=random_word_swap
bash original_scripts/image_clip_bart_corr_subset/full_finetuning.sh $((PORT+8)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_full_finetuning_${RATIO}_${METHOD}_${SEVERITY}.out



