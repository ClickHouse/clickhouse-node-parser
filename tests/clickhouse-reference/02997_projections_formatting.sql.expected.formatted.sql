CREATE TEMPORARY TABLE t_proj
(
    t DateTime,
    id UInt64,
    PROJECTION p (    SELECT
        id,
        t
    ORDER BY toStartOfDay(t) ASC)
)
ENGINE = MergeTree
ORDER BY id;

CREATE TEMPORARY TABLE t_proj2
(
    a UInt32,
    b UInt32,
    PROJECTION p (    SELECT a
    ORDER BY b * 2 ASC)
)
ENGINE = MergeTree
ORDER BY a;