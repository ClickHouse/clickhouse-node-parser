CREATE TABLE t0
(
    c0 Bool
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (c0);

SELECT part_name
FROM `system`.parts
WHERE table = 't0'
    AND database = currentDatabase();

SELECT c0
FROM t0;