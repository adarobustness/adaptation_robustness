# Benchmarking Robustness of Adaptation Methods on Pre-trained Vision-Language Models
This repository contains the code for the paper [Benchmarking Robustness of Adaptation Methods on Pre-trained Vision-Language Models](https://arxiv.org/abs/2306.02080).
We assess the robustness of 11 widely-used adaptation methods across 4 vision-language datasets under multimodal corruptions. Concretely, we introduce 7 benchmark datasets, including 96 visual and 87 textual corruptions, to investigate the robustness of different adaptation methods, the impact of available adaptation examples, and the influence of trainable parameter size during adaptation.


## Installation


## Code Structure

## Data & Pre-trained Models Preparation

## Usage

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