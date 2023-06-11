# -*- coding: utf-8 -*-

"""Check prompt init."""

import logging
from prompt import PromptController
from prompt import EncoderPromptConfig
from torch.nn.init import normal_

logger = logging.getLogger(__name__)

config = EncoderPromptConfig()
config.tasks = ["vqa"]
config.prompt_len = 12
config.mid_dim = 800
prompt_modules = PromptController(config)
print(prompt_modules)
print(prompt_modules.get_prompt("vqa").prefix_embedding[0].weight[0, 0:10])
for task in prompt_modules.tasks:
    normal_(
        prompt_modules.get_prompt(task).prefix_embedding[0].weight,
    )

