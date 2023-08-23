# Benchmarking Robustness of Adaptation Methods on Pre-trained Vision-Language Models
This repository contains the code for the paper [Benchmarking Robustness of Adaptation Methods on Pre-trained Vision-Language Models](https://arxiv.org/abs/2306.02080).
We assess the robustness of 11 widely-used adaptation methods across 4 vision-language datasets under multimodal corruptions. Concretely, we introduce 7 benchmark datasets, including 96 visual and 87 textual corruptions, to investigate the robustness of different adaptation methods, the impact of available adaptation examples, and the influence of trainable parameter size during adaptation.


## Installation
```bash
# git clone 
git clone git@github.com:adarobustness/adaptation_robustness.git
cd adaptation_robustness
# create conda environment (optional)
conda create -n adaptation_robustness python=3.8
conda activate adaptation_robustness
# install requirements
pip install -r requirements.txt
 # install langugae evaluation 
pip install git+https://github.com/bckim92/language-evaluation.git
python -c "import language_evaluation; language_evaluation.download('coco')"
# Download T5/BART backbone checkpoint
python download_backbones.py
```

## Code Structure
```bash
├── VL-T5
│   ├── original_scripts
│   │   ├── image_clip_bart # adapt CLIP-BART+adaptation methods
│   │   ├── image_clip_bart_corr_hp # inference CLIP-BArt+adaptation methods with different hyperparameters 
│   │   ├── image_clip_bart_corr_subset # adapt CLIP-BART+adaptation methods with different subsets of adaptation data
│   │   ├── image_clip_bart_corr_test # inference CLIP-BART+adaptation methods
│   │   ├── image_clip_bart_hp # adapt CLIP-BART+adaptation methods with different hyperparameters
│   │   ├── image_clip_t5 # adapt CLIP-T5+adaptation methods
│   │   ├── image_clip_t5_corr_hp # inference CLIP-T5+adaptation methods with different hyperparameters
│   │   ├── image_clip_t5_corr_subset # adapt CLIP-T5+adaptation methods with different subsets of adaptation data
│   │   ├── image_clip_t5_corr_test # inference CLIP-T5+adaptation methods
│   │   └── image_clip_t5_hp # adapt CLIP-T5+adaptation methods with different hyperparameters
│   ├── scripts # scripts for experiments deployment in a more convenient way
│   └── src
│       ├── clip # CLIP model
│       ├── adapters # Adapter, Compacter, Hyperformer
│       ├── lora # LoRA adaptation method 
│       ├── prompt # prompting adaptation methods
│       ├── my_transformers # T5/BART model
│       ├── caption*.py # captioning tasks
│       ├── gqa*.py # GQA tasks
│       ├── nlvr*.py # NLVR tasks
│       ├── vqa*.py # VQA tasks 
│       ├── multitask.py # Entrance of multitask setting 
├── download_backbones.py # download T5/BART backbone checkpoint
├── feature_extraction # extract image features

```
## Data & Pre-trained Models Preparation
### Default Directory Structure
This repo assumes the following directory structure for data and pre-trained models:
```bash
├── datasets # datasets, extracted features, and corrupted datasets
│   ├── COCO
│   │   ├── images 
│   │   ├── clip_features
│   ├── VG
│   │   ├── images 
│   │   ├── clip_features
│   ├── GQA
│   │   ├── images 
│   │   ├── clip_features
│   ├── nlvr
│   │   ├── images 
│   │   ├── clip_features
│   ├── vqa
│   ├── lxmert
├── VL-T5
│   ├── snap # adaptation checkpoints and output logs
│   │   └── VLBart_multitask # pre-trained CLIP-BART+adaptation model
│   │   └── VLT5_multitask # pre-trained CLIP-T5+adaptation model
```
### Download Datasets & Pre-trained Models
1. Download processed CLIP features from this [link](https://drive.google.com/file/d/1O_RU1iFh_sbItZCTkOHUrbVIQQ_89Djj/view?usp=sharing) and put extracted files under `datasets` directory.
2. Download [VQA](https://visualqa.org/download.html), [NLVR^2](https://lil.nlp.cornell.edu/nlvr/), and [GQA](https://cs.stanford.edu/people/dorarad/gqa/download.html) and organize the data following the default directory structure.
3. Download pre-trained CLIP-BART+adaptation model from this [link](https://1drv.ms/f/s!AuM6KaUpJK3Tunf9mUd_C0mi7vvn?e=66n06L) and put extracted files under `VL-T5/snap` directory.

### Dataset Corruption
1. Install [corruption](https://github.com/adarobustness/corruption)
2. Run `python corruption.py ...` following instructions from [corruption](https://github.com/adarobustness/corruption) to generate corrupted datasets
3. Put corrupted datasets under `datasets` directory following the default directory structure.
4. Or you can directly download the corrupted data [here](https://huggingface.co/datasets/ShuoChen99/adarobustness).

### Feature Extraction on Corrupted Datasets
```bash
cd feature_extraction
# CORRUPTION_METHOD_NAME: corruption method name, e.g., 'gaussian_noise'
# SEVERITY: corruption severity, e.g., '1', '2', '3', '4', '5'
# GPU_ID: GPU ID, e.g., '0'
# DATASET_NAME: dataset name, e.g., 'coco', 'vg', 'gqa', 'nlvr', 'vqa'
# PREFIX: prefix of the output file, e.g., 'coco', 'vg', 'gqa', 'nlvr', 'vqa'
bash extract_clip_features.sh \
  ${CORRUPTION_METHOD_NAME} \
  ${SEVERITY} \
  ${GPU_ID} \
  ${DATASET_NAME} \
  ${PREFIX}
```

## Benchmarking Robustness of Adaptation Methods
### Running Adaptation
```bash
# Adapt CLIP-BART+adaptation methods
# PORT: port number, e.g., '26000'
# GPU_NUMBER: number of GPUs, e.g., '1'
bash original_scripts/image_clip_bart/full_finetuning.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/multiple_adapters.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/half_shared_adapters.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/single_adapter.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/hyperformer.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/multiple_compacters.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/single_compacter.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/multiple_lora.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/single_lora.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/multiple_prompts.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_bart/single_prompt.sh ${PORT} --gpu_number ${GPU_NUMBER} 
# Adapt CLIP-T5+adaptation methods
bash original_scripts/image_clip_t5/full_finetuning.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_t5/multiple_adapters.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_t5/single_adapter.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_t5/hyperformer.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_t5/multiple_compacters.sh ${PORT} --gpu_number ${GPU_NUMBER}
bash original_scripts/image_clip_t5/single_compacter.sh ${PORT} --gpu_number ${GPU_NUMBER}

# Adapt CLIP-BART+adaptation methods with different hyperparameters
# PROMPT_LEN: prompt length, e.g., '64'
# PROMPT_POSITION: prompt position, e.g., 'front'
# REDUCTION_FACTOR: reduction factor, e.g., '2'
# LORA_DIM: LoRA dimension, e.g., '64'
bash original_scripts/image_clip_bart_hp/single_prompt.sh ${PORT}  --gpu_number ${GPU_NUMBER} --encoder_prompt_len ${PROMPT_LEN}
bash original_scripts/image_clip_bart_hp/single_prompt_position.sh ${PORT}  --gpu_number ${GPU_NUMBER} --encoder_prompt_position ${PROMPT_POSITION}
bash original_scripts/image_clip_bart_hp/single_adapter.sh ${PORT}  --gpu_number ${GPU_NUMBER} --reduction_factor ${REDUCTION_FACTOR}
bash original_scripts/image_clip_bart_hp/single_lora.sh ${PORT}  --gpu_number ${GPU_NUMBER} --lora_dim ${LORA_DIM}

# Adapt CLIP-BART+adaptation methods with different adaptation data size
# ADAPTATION_DATA_SIZE: adaptation data size, e.g., '0.2', '0.4'
bash original_scripts/image_clip_bart/full_finetuning.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/hyperformer.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/single_adapter.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/multiple_adapters.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/multiple_compacters.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/single_compacter.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/single_lora.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}

```

### Robusntess Evaluation
- Specify corruption methods
```bash
# Inference CLIP-BART+adaptation methods on corrupted image datasets
# METHOD: corruption method, e.g. gaussian_noise
# SEVERITY: corruption severity, e.g. 1, 2, 3, 4, 5
bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/half_shared_adapters.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/single_adapter.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/hyperformer.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 

bash original_scripts/image_clip_bart_corr_test/single_lora.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 

bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 

bash original_scripts/image_clip_bart_corr_test/single_prompt.sh ${PORT} \
  --img_corruption_method ${METHOD} \
  --img_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 

# Inference CLIP-BART+adaptation methods on corrupted text datasets
bash original_scripts/image_clip_bart_corr_test/full_finetuning.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/multiple_adapters.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/half_shared_adapters.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/single_adapter.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/hyperformer.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/multiple_compacters.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/single_compacter.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
  
bash original_scripts/image_clip_bart_corr_test/multiple_lora.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 

bash original_scripts/image_clip_bart_corr_test/single_lora.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 

bash original_scripts/image_clip_bart_corr_test/multiple_prompts.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 

bash original_scripts/image_clip_bart_corr_test/single_prompt.sh ${PORT} \
  --text_corruption_method ${METHOD} \
  --text_corruption_severity ${SEVERITY} \
  --gpu_number ${GPU_NUMBER} 
```

- We also provide some scripts (`VL-T5/scripts`) to deploy multiple inference experiments at the same time. For example, the following commands will deploy inference experiments of full fine-tuning on all image corruptions with severity 5 on GPU 0 to 3, respectively.
```bash
pids=()
nohup bash scripts/corr_image_test_clip_bart/full_finetuning/corr_test_full_finetuning_0.sh 0 5 26587 > corr_test_image_full_finetuning_severity_5_1.out 2>&1 &
pids+=($!)
nohup bash scripts/corr_image_test_clip_bart/full_finetuning/corr_test_full_finetuning_1.sh 1 5 26687 > corr_test_image_full_finetuning_severity_5_2.out 2>&1 &
pids+=($!)
nohup bash scripts/corr_image_test_clip_bart/full_finetuning/corr_test_full_finetuning_2.sh 2 5 26787 > corr_test_image_full_finetuning_severity_5_3.out 2>&1 &
pids+=($!)
nohup bash scripts/corr_image_test_clip_bart/full_finetuning/corr_test_full_finetuning_3.sh 3 5 26887 > corr_test_image_full_finetuning_severity_5_4.out 2>&1 &
pids+=($!)
echo "active processes: ${#pids[@]} for full finetuning"
for ((i=${#pids[@]}; i>1; i--)) ; do
    wait -n
done
echo "all processes finished for full finetuning on all image corruptions with severity 5"
```
- More examples of deploying inference multiple adapters based on CLIP-BART against both all image corruptions and all text corruptions with severity 1 to 5 on GPU 0 to 3, respectively. 
```bash
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 0 1 26587 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 0 1 26687 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 1 1 26787 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 1 1 26887 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 2 2 26187 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 2 2 26287 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 3 2 26387 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 3 2 26487 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 0 3 26587 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 0 3 26687 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 1 3 26787 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 1 3 26887 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 2 4 26987 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 2 4 26187 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 3 4 26287 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 3 4 26387 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 2 5 26487 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 2 5 27087 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 3 5 27187 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_image_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 3 5 27287 > corr_test_multiple_adapters_3.out 2>&1 &

nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 0 1 27387 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 0 1 27487 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 1 1 27587 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 1 1 27687 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 2 2 27787 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 2 2 27887 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 3 2 27987 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 3 2 28087 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 0 3 28187 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 0 3 28287 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 1 3 28387 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 1 3 28487 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 2 4 28587 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 2 4 28687 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 3 4 28787 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 3 4 28887 > corr_test_multiple_adapters_3.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_0.sh 2 5 28987 > corr_test_multiple_adapters_0.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_1.sh 2 5 29087 >  corr_test_multiple_adapters_1.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_2.sh 3 5 29187 > corr_test_multiple_adapters_2.out 2>&1 &
nohup bash scripts/corr_text_test_clip_bart/multiple_adapters/corr_test_multiple_adapters_3.sh 3 5 29287 > corr_test_multiple_adapters_3.out 2>&1 &
```
- `VL-T5/src/collect_results.py` is used to collect the results of the above experiments.
```bash
cd VL-T5
python src/colect_results.py
```

## Acknowledgement
This repo is built based on the following repos:
- [VL_adapter](https://github.com/ylsung/VL_adapter/tree/main)
- [VLT5](https://github.com/j-min/VL-T5)
- [CLIP](https://github.com/openai/CLIP)
- [LoRA](https://github.com/microsoft/LoRA)
- [adapter-bert](https://github.com/google-research/adapter-bert)
- [Compacter](https://github.com/ylsung/compacter)
- [Hyperformer](https://github.com/rabeehk/hyperformer)
- [Prefix-tuning](https://github.com/XiangLi1999/PrefixTuning)

## Citation
Please cite our paper if you find this repo useful in your research:
```bibtex
@article{chen2023benchmarking,
  title={Benchmarking Robustness of Adaptation Methods on Pre-trained Vision-Language Models},
  author={Chen, Shuo and Gu, Jindong and Han, Zhen and Ma, Yunpu and Torr, Philip and Tresp, Volker},
  journal={arXiv preprint arXiv:2306.02080},
  year={2023}
}
```
