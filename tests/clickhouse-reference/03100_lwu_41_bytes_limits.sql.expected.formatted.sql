SYSTEM DROP  TABLE IF EXISTS t_lwu_bytes_limits;

CREATE TABLE t_lwu_bytes_limits
(
    id UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1, max_uncompressed_bytes_in_patches = '100Ki';

SET enable_lightweight_update = 1;

INSERT INTO t_lwu_bytes_limits SELECT
    number,
    randomPrintableASCII(10)
FROM numbers(1000000);

SELECT id
FROM t_lwu_bytes_limits
WHERE s = 'foo'
ORDER BY id ASC;

SYSTEM DROP  TABLE t_lwu_bytes_limits;

CREATE TABLE t_lwu_bytes_limits
(
    id UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03100_lwu_41_bytes_limits', '1')
ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1, max_uncompressed_bytes_in_patches = '100Ki';