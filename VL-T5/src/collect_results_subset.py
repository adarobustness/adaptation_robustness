# -*- coding: utf-8 -*-

"""Collect corruption test results from adaptation on subsets."""

import logging
import os
import pwd
import json
import socket
# from constants import IMG_CORRUPTION_METHODS, TEXT_CORRUPTION_METHODS
import pandas as pd
logging.basicConfig(
    level=logging.CRITICAL,
    format='[%(levelname)s:%(asctime)s:%(name)s:%(filename)s:%(lineno)d]\t %(message)s',
)
logger = logging.getLogger(__name__)
HOST_NAME = socket.gethostname()


MODEL = "VLBart_multitask"
# MODEL = "VLT5_multitask"
IMG_CORRUPTION_METHODS = [
    # "none", # no corruption
    # "blank_image",
    "gaussian_noise",
    "shot_noise",
    "impulse_noise",
    "defocus_blur",
    "glass_blur",
    "motion_blur",
    "zoom_blur",
    "gaussian_blur",
    "snow",
    "frost",
    "fog",
    "brightness",
    "contrast",
    "elastic_transform",
    "pixelate",
    "jpeg_compression",
    "speckle_noise",
    "spatter",
    "saturate"
]
TEXT_CORRUPTION_METHODS = [
    "none", # no corruption
    "ocr",
    "swap_prefix",
    "punctuation",
    "typos",
    "keyboard",
    "spell_error",
    "random_char_delete",
    "random_char_insert",
    "random_char_replace",
    "random_char_swap",
    "to_passive",
    "to_active",
    "to_casual",
    "to_formal",
    "tense",
    "double_denial",
    "insert_adv",
    "append_irr",
    "random_word_insert",
    "drop_nn",
    "drop_vb",
    "drop_vb_nn",
    "drop_rand_one_nn",
    "drop_rand_one_vb",
    "only_nn",
    "only_vb",
    "only_vb_nn",
    "drop_first",
    "drop_last",
    "drop_first_and_last",
    "shuffle_order",
    "random_word_delete",
    "mlm_suggestion",
    "swap_syn_word_emb",
    "swap_syn_word_net",
    "swap_multi_pos_jj",
    "swap_multi_pos_nn",
    "back_trans",
    "random_word_swap",
    "nonsense",
]


TEXT_CORR_METHODS_WITHOUT_SEVERITY = [
    "punctuation",
    "to_active",
    "to_passive",
    "to_formal",
    "to_casual",
    "tense",
    "double_denial",

    "append_irr",

    "insert_adv",

    "drop_first",
    "drop_last",
    "drop_first_and_last",
    "shuffle_order",
    "drop_nn",
    "drop_rand_one_nn",
    "drop_rand_one_vb",
    "drop_vb",
    "drop_vb_nn",
    "only_nn",
    "only_vb",
    "only_vb_nn",

    "back_trans",
    "nonsense"
]


if "htc" in HOST_NAME:
    BASE_OUT_PATH = f"/data/engs-tvg/oxfd1618/robustness_research/adapter_robustness/VL_adapter/VL-T5/snap/{MODEL}/"
elif "mcml" in HOST_NAME or "dgx" in HOST_NAME:
    if pwd.getpwuid(os.getuid())[0] == "ra75gan2":
        BASE_OUT_PATH = f"/dss/dssmcmlfs01/pn69za/pn69za-dss-0002/ra75gan2/robustness/VL_adapter/VL-T5/snap/{MODEL}/"
    elif pwd.getpwuid(os.getuid())[0] == "di93zun":
        BASE_OUT_PATH = f"/dss/dssmcmlfs01/pn34sa/pn34sa-dss-0000/robustness/VL_adapter/VL-T5/snap/{MODEL}/"

elif "plunder" in HOST_NAME:
    BASE_OUT_PATH = f"/zhome/stud/chensh/robustness/VL_adapter/VL-T5/snap/{MODEL}/"
elif "dgk" in HOST_NAME:
    BASE_OUT_PATH = f"/jmain02/home/J2AD008/wga21/jxg52-wga21/robustness_cs/VL_adapter/VL-T5/snap/{MODEL}/"
logger.info(f"HOST_NAME: {HOST_NAME}")
logger.info(f"BASE_OUT_PATH: {BASE_OUT_PATH}")


def collect_results_for_one_corruption(corruption_method_name, corr_dir_prefix, ratio=0.2):
    assert corruption_method_name in IMG_CORRUPTION_METHODS + TEXT_CORRUPTION_METHODS and corruption_method_name != "none" ,(
        f"corruption_method_name = {corruption_method_name} is not valid!"
    )
    result_dict = {}
    for severity in range(1, 6):
        out_dir = os.path.join(
            BASE_OUT_PATH,
            f"{corr_dir_prefix}_subset_ratio_{ratio}_{corruption_method_name}_{severity}"
            # f"{corr_dir_prefix}_ratio_{ratio}_{corruption_method_name}_{severity}"
        )
        logger.info(f"out_dir = {out_dir}")
        for _, _, files in os.walk(out_dir):
            for file in files:
                if "score_dict.json" in file:
                    task = file.split("_")[0]
                    file_path = os.path.join(out_dir, file)
                    if task not in result_dict:
                        result_dict[task] = {}
                    task_result = get_task_result(task, file_path)
                    logger.info(f"severity = {severity} task = {task}, task_result = {task_result}")
                    result_dict[task][severity] = task_result
    return result_dict


def get_task_result(task_name: str, result_json: str):
    with open(result_json, "r") as f:
        content = f.read()
        content = json.loads(content)
    if task_name == "vqa":
        return content["overall"]
    elif task_name == "nlvr":
        return content["accuracy"] * 100
    elif task_name == "gqa":
        return content["Accuracy"] * 100
    elif task_name == "caption":
        return content["CIDEr"] * 100
    else:
        raise ValueError(f"task_name = {task_name} is not valid!")


def obtain_clean_performance(corr_out_prefix, ratio):
    out_dir = os.path.join(
        BASE_OUT_PATH,
        f"{corr_out_prefix}_subset_ratio_{ratio}_none_5"
    )
    logger.info(f"out_dir = {out_dir}")
    result_dict = {}
    for _, _, files in os.walk(out_dir):
        for file in files:
            if "score_dict.json" in file:
                task = file.split("_")[0]
                file_path = os.path.join(out_dir, file)
                if task not in result_dict:
                    result_dict[task] = {}
                task_result = get_task_result(task, file_path)
                logger.info(f"severity = 5 task = {task}, task_result = {task_result}")
                result_dict[task] = task_result
    return result_dict


def obtain_corr_result_per_adaption(corr_out_prefix, severity=5, modality="img", ratio=0.2):
    df = pd.DataFrame(columns=["corruption", "severity",
                               "VQA", "VQA decrease", "VQA decrease ratio",
                               "GQA", "GQA decrease", "GQA decrease ratio",
                               "NLVR", "NLVR decrease", "NLVR decrease ratio",
                               "Caption", "Caption decrease", "Caption decrease ratio"
                               ])
    clean_performance = obtain_clean_performance(corr_out_prefix, ratio=ratio)
    try:
        df.loc[len(df)] = ["clean", "none", clean_performance["vqa"], 0, 0, clean_performance["gqa"], 0, 0,
                       clean_performance["nlvr"], 0, 0, clean_performance["caption"], 0, 0]
    except KeyError:
        logger.error(f"clean performance none for {corr_out_prefix} {ratio} does not exist!")
    logger.info(f"clean_performance = {clean_performance}")
    logger.info(f"df = {df}")
    ori_severity = severity
    if modality == "img":
        corruption_methods = IMG_CORRUPTION_METHODS
    elif modality == "text":
        corruption_methods = TEXT_CORRUPTION_METHODS
    for method_name in corruption_methods:
        if method_name == "none":
            continue
        if method_name in TEXT_CORR_METHODS_WITHOUT_SEVERITY:
            severity = 5
        else:
            severity = ori_severity
        try:
            avg_result_dict = collect_results_for_one_corruption(method_name, corr_out_prefix, ratio=ratio)
            vqa_corr_result = avg_result_dict["vqa"][severity]
            gqa_corr_result = avg_result_dict["gqa"][severity]
            nlvr_corr_result = avg_result_dict["nlvr"][severity]
            caption_corr_result = avg_result_dict["caption"][severity]
            vqa_ori_result = clean_performance["vqa"]
            gqa_ori_result = clean_performance["gqa"]
            nlvr_ori_result = clean_performance["nlvr"]
            caption_ori_result = clean_performance["caption"]

            df.loc[len(df)] = [
                method_name, severity,
                round(vqa_corr_result, 3), round(vqa_corr_result - vqa_ori_result, 3), f"{(vqa_corr_result - vqa_ori_result) / vqa_ori_result:.3%}",
                round(gqa_corr_result, 3), round(gqa_corr_result - gqa_ori_result, 3), f"{(gqa_corr_result - gqa_ori_result) / gqa_ori_result:.3%}",
                round(nlvr_corr_result, 3), round(nlvr_corr_result - nlvr_ori_result, 3), f"{(nlvr_corr_result - nlvr_ori_result) / nlvr_ori_result:.3%}",
                round(caption_corr_result, 3), round(caption_corr_result - caption_ori_result, 3), f"{(caption_corr_result - caption_ori_result) / caption_ori_result:.3%}",
            ]
            logger.info(method_name, avg_result_dict)
        except Exception as e:
            print(f"avg_result_dict = {avg_result_dict}")
            print(f"Error: {e} during processing {method_name}")
            # raise e
            continue
    df.set_index("corruption", inplace=True)
    if modality == "img":
        df = df.reindex([
            "clean",
            "impulse_noise",
            "gaussian_noise",
            "shot_noise",
            "speckle_noise",
            "zoom_blur",
            "defocus_blur",
            "motion_blur",
            "glass_blur",
            "gaussian_blur",
            "jpeg_compression",
            "contrast",
            "elastic_transform",
            "pixelate",
            "snow",
            "frost",
            "fog",
            "brightness",
            "spatter",
            "saturate",
        ])
    elif modality == "text":
        df = df.reindex([
            "clean",
            "ocr",
            "swap_prefix",
            "punctuation",
            "typos",
            "keyboard",
            "spell_error",
            "random_char_insert",
            "random_char_replace",
            "random_char_swap",
            "random_char_delete",
            "to_passive",
            "tense",
            "to_formal",
            "to_casual",
            "to_active",
            "double_denial",
            "insert_adv",
            "append_irr",
            "random_word_insert",
            "drop_nn",
            "drop_rand_one_nn",
            "drop_vb",
            "drop_vb_nn",
            "only_nn",
            "only_vb",
            "only_vb_nn",
            "drop_rand_one_vb",
            "drop_first",
            "drop_last",
            "drop_first_and_last",
            "shuffle_order",
            "random_word_delete",
            "mlm_suggestion",
            "swap_multi_pos_nn",
            "swap_multi_pos_jj",
            "swap_syn_word_emb",
            "swap_syn_word_net",
            "back_trans",
            "random_word_swap",
            "nonsense",
        ])
    df.to_csv(f"{MODEL}_{corr_out_prefix}_{modality}_{severity}_corr_result_per_adaption_ratio_{ratio}.csv", index=True)
    print(df)


if __name__ == "__main__":

    Bart_prefix = [
        # "corr_test_4tasks_full_fituning",
        "corr_test_4tasks_single_adapter",
        # "corr_test_4tasks_multiple_compacters",
        # "corr_test_4tasks_half_shared_adapters",
        # "corr_test_4tasks_multiple_adapters",
        # "corr_test_4tasks_hyperformer",
        # "corr_test_4tasks_single_compacter",
        # "corr_test_4tasks_multiple_lora",
        # "corr_test_4tasks_single_lora",
        # "corr_test_4tasks_single_prompt",
        # "corr_test_4tasks_multiple_prompts",
    ]
    T5_prefix = [
        "corr_test_4tasks_full_finetuning",
        "corr_test_4tasks_hyperformer",
        "corr_test_4tasks_single_adapter",
        "corr_test_4tasks_multiple_compacters",
        "corr_test_4tasks_single_compacter",
        "corr_test_4tasks_multiple_adapters",
    ]

    for BASE_OUT_DIR_PREFIX in Bart_prefix:
        # obtain_corr_result_per_adaption(BASE_OUT_DIR_PREFIX, severity=5, modality="img", ratio=0.2)
        # logger.info(f"Done on {MODEL} {BASE_OUT_DIR_PREFIX} with severity {5} and ratio 0.2!")
        print(f"===================={BASE_OUT_DIR_PREFIX} STARTS ====================")
        for ratio in [0.2, 0.4, 0.6, 0.8] :
            obtain_corr_result_per_adaption(BASE_OUT_DIR_PREFIX, severity=5, modality="img", ratio=ratio)
            print(f"Done on {MODEL} {BASE_OUT_DIR_PREFIX} with severity {5} and ratio {ratio}!")
            obtain_corr_result_per_adaption(BASE_OUT_DIR_PREFIX, severity=5, modality="text", ratio=ratio)
            print(f"Done on {MODEL} {BASE_OUT_DIR_PREFIX} with severity {5} and ratio {ratio}!")
            print(f"--------- ratio {ratio} ends ---------")
        print(f"===================={BASE_OUT_DIR_PREFIX} ENDS=================")