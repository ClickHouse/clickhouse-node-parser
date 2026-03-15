-- Tags: no-random-settings, no-fasttest, no-tsan, no-asan, no-msan
SET allow_suspicious_fixed_string_types = 1;

CREATE TABLE fat_granularity
(
    x UInt32,
    fat FixedString(160000)
)
ENGINE = MergeTree
ORDER BY x
SETTINGS storage_policy = 's3_cache';

SET max_memory_usage = '10G';

-- Too large sizes of FixedString to deserialize
SELECT x
FROM fat_granularity
PREWHERE like(fat, '256\\_%')
SETTINGS max_threads = 2;