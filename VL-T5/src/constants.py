# -*- coding: utf-8 -*-

"""Naming Conventions."""

import logging

logger = logging.getLogger(__name__)

__all__ = [
    "IMG_CORRUPTION_METHODS",
    "TEXT_CORRUPTION_METHODS",
]

# originated from the method.__name__ in corruption_cs/image_corruption/corruption_methods.py
IMG_CORRUPTION_METHODS = [
    "none", # no corruption
    "blank_image",
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

