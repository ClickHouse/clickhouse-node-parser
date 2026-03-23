SET optimize_use_projections = 1;

DROP TABLE IF EXISTS t;

CREATE TABLE t
(
    i int,
    j int,
    PROJECTION x (    SELECT *
    ORDER BY j ASC)
)
ENGINE = MergeTree
ORDER BY i
PARTITION BY i;

INSERT INTO t;

SELECT count()
FROM `system`.projection_parts
WHERE database = currentDatabase()
    AND table = 't'
    AND active;

DROP TABLE t;