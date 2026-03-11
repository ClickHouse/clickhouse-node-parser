SELECT 1
FROM test_rows_compact_part__fuzz_11
WHERE exists((
        SELECT 1
    ))
SETTINGS enable_analyzer = 1;