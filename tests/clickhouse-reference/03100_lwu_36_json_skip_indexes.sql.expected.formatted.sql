CREATE TABLE test
(
    id UInt64,
    document JSON(name String, age UInt16),
    INDEX ix_name document.name TYPE bloom_filter(0.01) GRANULARITY 1,
    INDEX ix_country document.country::String TYPE bloom_filter(0.01) GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY (id)
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1, index_granularity = 1;

SET enable_lightweight_update = 1;

SELECT *
FROM test
WHERE document.name = 'aaa'
    OR document.name = 'boo'
ORDER BY id ASC
SETTINGS apply_patch_parts = 1;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT *
        FROM test
        WHERE document.name = 'aaa'
            OR document.name = 'boo'
        ORDER BY id ASC
        SETTINGS apply_patch_parts = 1
    )
WHERE like(s, 'Granules: %');

SELECT *
FROM test
WHERE document.name = 'aaa'
    OR document.name = 'boo'
ORDER BY id ASC
SETTINGS apply_patch_parts = 0;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT *
        FROM test
        WHERE document.name = 'aaa'
            OR document.name = 'boo'
        ORDER BY id ASC
        SETTINGS apply_patch_parts = 0
    )
WHERE like(s, 'Granules: %');

SELECT count()
FROM test
WHERE document.country::String = 'USA'
SETTINGS apply_patch_parts = 1;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM test
        WHERE document.country::String = 'USA'
        SETTINGS apply_patch_parts = 1
    )
WHERE like(s, 'Granules: %');

SELECT count()
FROM test
WHERE document.country::String = 'USA'
SETTINGS apply_patch_parts = 0;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM test
        WHERE document.country::String = 'USA'
        SETTINGS apply_patch_parts = 0
    )
WHERE like(s, 'Granules: %');