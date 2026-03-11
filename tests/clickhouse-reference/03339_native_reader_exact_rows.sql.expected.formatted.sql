SELECT number
FROM numbers(5e6)
ORDER BY number * 1234567890123456789 ASC
LIMIT 4999980, 20
SETTINGS
    max_threads = 1,
    max_memory_usage = '220Mi',
    max_block_size = 65540,
    max_bytes_before_external_sort = '2Mi',
    max_bytes_ratio_before_external_sort = 0
FORMAT Null;