DROP TABLE IF EXISTS t_lwu_on_fly;

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

INSERT INTO t_lwu_on_fly (id);

SET apply_patch_parts = 1;

SET apply_mutations_on_fly = 1;

ALTER TABLE t_lwu_on_fly UPDATE b = 20 WHERE a = 2 SETTINGS mutations_sync = 0;

SELECT *
FROM t_lwu_on_fly
ORDER BY id ASC;

DROP TABLE t_lwu_on_fly;