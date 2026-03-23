SYSTEM DROP  TABLE IF EXISTS t;

CREATE TABLE t
(
    uid Int16,
    name String,
    age Nullable(Int8),
    i Int16,
    j Int16,
    PROJECTION p1 (    SELECT
        name,
        age,
        uniq(i),
        count(j)
    GROUP BY
        name,
        age)
)
ENGINE = MergeTree
ORDER BY uid
SETTINGS index_granularity = 1;

INSERT INTO t;

SET alter_sync = 0;

-- Projection query works without mutation applied.
SELECT count(j)
FROM t
GROUP BY
    name,
    age;

SET alter_sync = 1;

SYSTEM DROP  TABLE t;