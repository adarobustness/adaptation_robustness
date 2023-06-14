SEVERITY=$2
PORT=$3
GPU_NUMBER=$1
RATIO=$4

METHOD=drop_nn
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_vb
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT+1)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_vb_nn
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT+2)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_rand_one_nn
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT+3)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=drop_rand_one_vb
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT+4)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=only_nn
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT+5)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=only_vb
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT+6)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out

METHOD=only_vb_nn
bash original_scripts/image_clip_t5_corr_subset/single_adapter.sh $((PORT+7)) \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} \
  --subset_ratio ${RATIO} \
  &> test_on_corrupted_text_single_adapter_${RATIO}_${METHOD}_${SEVERITY}_t5.out



