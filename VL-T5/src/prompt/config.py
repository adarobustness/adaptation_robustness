from dataclasses import dataclass
from torch.nn.init import normal_
from torch.nn.init import uniform_
from torch.nn.init import xavier_normal_
from torch.nn.init import kaiming_normal_


PROMPT_INIT_METHODS = {
                "normal": normal_,
                "uniform": uniform_,
                "xavier_normal": xavier_normal_,
                "kaiming_normal": kaiming_normal_,
            }
# front: prompt - input - vis
# back: input - vis - prompt
# middle: input - prompt - vis
PROMPT_POSITIONS = ["front", "back", "middle"]
@dataclass
class EncoderPromptConfig(object):
    seq_len = 0
    input_dim = 768
    mid_dim = 768
    use_input_prompt = True
    use_single_prompt = False
    init_method = "normal"
    position = "front"

@dataclass
class DecoderPromptConfig(object):
    seq_len = 0
    input_dim = 768
    mid_dim = 768
    use_input_prompt = True
    use_single_prompt = False
