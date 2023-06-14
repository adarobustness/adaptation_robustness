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

### Feature Extraction on Corrupted Datasets
```bash
cd feature_extraction
bash extract_clip_features.sh \
  ${CORRUPTION_METHOD_NAME} \
  ${SEVERITY} \
  ${GPU_ID} \
  ${DATASET_NAME} \
  ${PREFIX}
```

## Benchmarking Robustness of Adaptation Methods
### Running Adaptation (optional)
```bash
# Adapt CLIP-BART+adaptation methods
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
bash original_scripts/image_clip_bart_hp/single_prompt.sh ${PORT}  --gpu_number ${GPU_NUMBER} --encoder_prompt_len ${PROMPT_LEN}
bash original_scripts/image_clip_bart_hp/single_prompt_position.sh ${PORT}  --gpu_number ${GPU_NUMBER} --encoder_prompt_position ${PROMPT_POSITION}
bash original_scripts/image_clip_bart_hp/single_adapter.sh ${PORT}  --gpu_number ${GPU_NUMBER} --reduction_factor ${REDUCTION_FACTOR}
bash original_scripts/image_clip_bart_hp/single_lora.sh ${PORT}  --gpu_number ${GPU_NUMBER} --lora_dim ${LORA_DIM}

# Adapt CLIP-BART+adaptation methods with different adaptation data size
bash original_scripts/image_clip_bart/full_finetuning.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/hyperformer.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/single_adapter.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/multiple_adapters.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/multiple_compacters.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/single_compacter.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}
bash original_scripts/image_clip_bart/single_lora.sh ${PORT} --gpu_number ${GPU_NUMBER} --train_topk ${ADAPTATION_DATA_SIZE}

```

### Robusntess Evaluation
```bash
# Inference CLIP-BART+adaptation methods on corrupted image datasets
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