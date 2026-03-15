-- Tags: no-replicated-database
-- no-replicated-database: SYSTEM STOP MERGES works only on one replica.
SET insert_keeper_fault_injection_probability = 0.0;

SET enable_lightweight_update = 1;

CREATE TABLE t_shared
(
    id UInt64,
    c1 UInt64
)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_shared/', '1')
ORDER BY id
SETTINGS enable_block_number_column = true, enable_block_offset_column = true;

SELECT
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_shared'
ORDER BY name ASC;

SELECT *
FROM t_shared
ORDER BY id ASC;