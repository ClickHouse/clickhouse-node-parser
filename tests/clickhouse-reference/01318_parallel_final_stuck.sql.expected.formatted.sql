SELECT x
FROM final_bug FINAL
ORDER BY x ASC
SETTINGS
    max_threads = 2,
    max_final_threads = 2,
    max_block_size = 8
FORMAT Null;