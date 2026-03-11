SELECT *
FROM t_02267
WHERE hasAll(a, ['x'])
ORDER BY b DESC
SETTINGS
    max_threads = 1,
    max_block_size = 1000;