CREATE TABLE t_src
(
    id UInt32,
    v UInt32
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY id;

CREATE TABLE t_dst
(
    id UInt32,
    v UInt32
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY id;

SELECT
    *,
    _part
FROM t_dst
ORDER BY v ASC;