CREATE TABLE invalid_min_index_granularity_bytes_setting
(
    id UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity_bytes = 1, min_index_granularity_bytes = 1024; -- { serverError BAD_ARGUMENTS }

CREATE TABLE valid_min_index_granularity_bytes_setting
(
    id UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity_bytes = 2024, min_index_granularity_bytes = 1024;

SELECT COUNT(*)
FROM valid_min_index_granularity_bytes_setting
WHERE value = 'xxxxxxxxxx1015';