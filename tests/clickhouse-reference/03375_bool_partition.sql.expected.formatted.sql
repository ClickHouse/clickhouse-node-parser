SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Bool
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (c0);

INSERT INTO t0 (c0);

SELECT part_name
FROM `system`.parts
WHERE table = 't0'
    AND database = currentDatabase();

SELECT c0
FROM t0;

SYSTEM DROP  TABLE t0;