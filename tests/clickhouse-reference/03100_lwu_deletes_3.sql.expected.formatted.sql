DROP TABLE IF EXISTS t_lwu_deletes_3;

CREATE TABLE t_lwu_deletes_3
(
    id UInt64,
    dt Date,
    v1 UInt64,
    v2 String
)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_lwu_deletes_3/', '1')
ORDER BY (id, dt)
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SET apply_patch_parts = 1;

SET enable_lightweight_update = 1;

SET lightweight_delete_mode = 'lightweight_update_force';

INSERT INTO t_lwu_deletes_3 SELECT
    number % 10000,
    toDate('2024-10-10'),
    0,
    ''
FROM numbers(100000);

INSERT INTO t_lwu_deletes_3 SELECT
    number % 10000,
    toDate('2024-11-11'),
    0,
    ''
FROM numbers(100000);

INSERT INTO t_lwu_deletes_3 SELECT
    number % 10000,
    toDate('2024-12-12'),
    0,
    ''
FROM numbers(100000);

SELECT
    300000 - 10 * 3 - 1500 * 10 - 500 * 10 * 3,
    42 * 10 * 5,
    0;

SELECT
    count(),
    sum(v1),
    sum(notEmpty(v2))
FROM t_lwu_deletes_3;

SELECT
    count(),
    uniqExact(partition_id),
    sum(`rows`)
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_lwu_deletes_3'
    AND column = '_row_exists'
    AND active
    AND startsWith(name, 'patch');

SELECT
    count(),
    sum(v1),
    sum(notEmpty(v2))
FROM t_lwu_deletes_3
SETTINGS apply_patch_parts = 0;

SELECT sum(`rows`)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_lwu_deletes_3'
    AND NOT startsWith(name, 'patch')
    AND active;

DROP TABLE t_lwu_deletes_3;