DROP TABLE IF EXISTS t_src;

DROP TABLE IF EXISTS t_dst;

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

INSERT INTO t_dst;

INSERT INTO t_dst;

INSERT INTO t_dst;

INSERT INTO t_src;

SELECT
    *,
    _part
FROM t_dst
ORDER BY v ASC;

DROP TABLE t_src;

DROP TABLE t_dst;