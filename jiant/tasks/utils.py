import numpy as np


def truncate_sequences(tokens_ls, max_length, truncate_end=True):
    if len(tokens_ls) == 0:
        return []
    if len(tokens_ls) == 1:
        if truncate_end:
            return [tokens_ls[0][:max_length]]
        else:
            return [tokens_ls[0][-max_length:]]
    lengths = np.array([len(tokens) for tokens in tokens_ls])
    total_length = lengths.sum()
    if total_length < max_length:
        return tokens_ls
    target_lengths = lengths
    while sum(target_lengths) > max_length:
        target_lengths[np.argmax(target_lengths)] -= 1

    return [
        tokens[:target_length] if truncate_end else tokens[-target_length:]
        for tokens, target_length in zip(tokens_ls, target_lengths)
    ]


def pad_to_max_seq_length(ls, max_seq_length, pad_idx=0, pad_right=True, check=True):
    padding = [pad_idx] * (max_seq_length - len(ls))
    if pad_right:
        result = ls + padding
    else:
        result = padding + ls

    if check:
        assert len(result) == max_seq_length
    return result
