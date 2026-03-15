SET optimize_skip_merged_partitions = 1;

CREATE TABLE optimize_final
(
    t DateTime,
    x Int32
)
ENGINE = MergeTree()
ORDER BY x
PARTITION BY toYYYYMM(t);

SELECT
    table,
    `partition`,
    active,
    level
FROM `system`.parts
WHERE table = 'optimize_final'
    AND database = currentDatabase()
    AND active = 1;