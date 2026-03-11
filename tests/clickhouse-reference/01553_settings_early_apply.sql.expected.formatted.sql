SELECT *
FROM numbers(10)
SETTINGS
    result_overflow_mode = 'break',
    max_block_size = 1
FORMAT PrettySpaceNoEscapes;