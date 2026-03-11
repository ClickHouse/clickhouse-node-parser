SELECT sum(sleep(0.1))
FROM tab
SETTINGS
    max_block_size = 1,
    max_execution_time = 1;