CREATE TABLE tab
(
    id UInt64,
    long_string String SETTINGS (min_compress_block_size = 163840, max_compress_block_size = 163840),
    v1 String,
    v2 UInt64,
    v3 Float32,
    v4 Float64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/tab/2870', 'r1')
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1;
SELECT count() FROM tab;
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string MODIFY SETTING min_compress_block_size = 8192;');
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string RESET SETTING min_compress_block_size;');
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string REMOVE SETTINGS;');
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string String SETTINGS (min_compress_block_size = 163840, max_compress_block_size = 163840);');
SELECT '---';
CREATE TABLE tab
(
    id UInt64,
    tup Tuple(UInt64, UInt64) SETTINGS (min_compress_block_size = 81920, max_compress_block_size = 163840),
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1;
SELECT tup FROM tab ORDER BY tup LIMIT 10;
-- Unsupported column-level settings are rejected
CREATE TABLE tab
(
    id UInt64,
    long_string String SETTINGS (min_block_size = 81920, max_compress_block_size = 163840),
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1; -- {serverError UNKNOWN_SETTING}
