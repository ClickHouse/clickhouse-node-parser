SET enable_lightweight_update = 1;

CREATE TABLE t_lwu_on_fly
(
    id UInt64,
    a UInt64,
    b UInt64,
    c UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t_lwu_on_fly', '1')
ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SET apply_patch_parts = 1;

SET apply_mutations_on_fly = 1;

SELECT *
FROM t_lwu_on_fly
ORDER BY id ASC;