SELECT uniqHLL12(x)
FROM t
SETTINGS
    optimize_use_projections = 1,
    max_bytes_to_read = 400,
    max_block_size = 8; -- { serverError TOO_MANY_BYTES }