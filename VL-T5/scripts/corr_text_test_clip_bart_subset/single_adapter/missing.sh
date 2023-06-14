nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26000 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 0 \
  --subset_ratio 0.1 \
  > test_on_corrupted_text_single_adapter_0.1_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26001 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 0 \
  --subset_ratio 0.2 \
  > test_on_corrupted_text_single_adapter_0.2_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26002 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 0 \
  --subset_ratio 0.3 \
  > test_on_corrupted_text_single_adapter_0.3_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26003 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 0 \
  --subset_ratio 0.4 \
  > test_on_corrupted_text_single_adapter_0.4_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26004 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 1 \
  --subset_ratio 0.5 \
  > test_on_corrupted_text_single_adapter_0.5_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26005 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 1 \
  --subset_ratio 0.6 \
  > test_on_corrupted_text_single_adapter_0.6_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26006 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 1 \
  --subset_ratio 0.7 \
  > test_on_corrupted_text_single_adapter_0.7_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26007 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 1 \
  --subset_ratio 0.8 \
  > test_on_corrupted_text_single_adapter_0.8_none_5.out 2>&1 &

nohup bash original_scripts/image_clip_bart_corr_subset/single_adapter.sh 26008 \
  --text_corruption_method none \
  --text_corruption_severity 5 \
  --gpu_number 0 \
  --subset_ratio 0.9 \
  > test_on_corrupted_text_single_adapter_0.9_none_5.out 2>&1 &
