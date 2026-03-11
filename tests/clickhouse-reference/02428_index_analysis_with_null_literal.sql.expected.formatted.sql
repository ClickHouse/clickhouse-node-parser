SELECT count()
FROM test
WHERE a = (
        SELECT toUInt64(1)
        WHERE 1 = 2
    )
SETTINGS
    enable_early_constant_folding = 0,
    force_primary_key = 1;

SELECT count()
FROM test_null_filter
WHERE key = NULL
    AND value > 0
SETTINGS force_primary_key = 1;