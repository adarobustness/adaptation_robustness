# -*- coding: utf-8 -*-

"""A utility script for NLVR2 to recover the img name, check validity and integrity."""

import logging
import os
from tqdm import tqdm
logging.basicConfig(
    level=logging.INFO,
    format='[%(levelname)s:%(asctime)s:%(name)s:%(filename)s:%(lineno)d]\t %(message)s',
)
logger = logging.getLogger(__name__)


BASE_DIR = "/homes/55/jindong/robustness_research/adapter_robustness/VL_adapter/datasets/nlvr/"

CORRUPTION_METHODS = [
    "gaussian_noise",
    "shot_noise",
    "impulse_noise",
    "defocus_blur",
    "glass_blur",
    "motion_blur",
    "zoom_blur",
    "snow",
    "frost",
    "fog",
    "brightness",
    "contrast",
    "elastic_transform",
    "pixelate",
    "jpeg_compression",
    "speckle_noise",
    "gaussian_blur",
    "spatter",
    "saturate"
]
SEVERITY = [1, 2, 3, 4, 5]
NLVR2_TEST_IMG_AMOUNT = 8082
def rename():
    for corruption_methods in tqdm(CORRUPTION_METHODS, desc="corruption_methods"):
        for severity in tqdm(SEVERITY, desc="severity"):
            if os.path.exists(os.path.join(BASE_DIR, f"images_test_{corruption_methods}_{severity}")):
                for _, _, files in os.walk(os.path.join(BASE_DIR, f"images_test_{corruption_methods}_{severity}")):
                    for file in tqdm(files, desc="files"):
                        if file.endswith(".png") and f"_{corruption_methods}_{severity}" in file:
                            os.rename(
                                os.path.join(BASE_DIR, f"images_test_{corruption_methods}_{severity}", file),
                                os.path.join(BASE_DIR, f"images_test_{corruption_methods}_{severity}", file.replace(f"_{corruption_methods}_{severity}", ""))
                            )

def check_number_of_images():
    for corruption_methods in CORRUPTION_METHODS:
        for severity in SEVERITY:
            if os.path.exists(os.path.join(BASE_DIR, f"images_test_{corruption_methods}_{severity}")):
                for _, _, files in os.walk(os.path.join(BASE_DIR, f"images_test_{corruption_methods}_{severity}")):
                    logger.info(f"{corruption_methods}_{severity}: {len(files)}")
                    assert len(files) == NLVR2_TEST_IMG_AMOUNT, (
                        f"{corruption_methods}_{severity} has {len(files)} images, but NLVR2 has {NLVR2_TEST_IMG_AMOUNT} images."
                    )
            else:
                logger.info(f"{corruption_methods}_{severity} does not exist.")


if __name__ == "__main__":
    check_number_of_images()