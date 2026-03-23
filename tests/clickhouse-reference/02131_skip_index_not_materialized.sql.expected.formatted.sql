SYSTEM DROP  TABLE IF EXISTS t_index_non_materialized;

CREATE TABLE t_index_non_materialized
(
    a UInt32
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t_index_non_materialized;

SELECT count()
FROM t_index_non_materialized
WHERE a = 1;

SYSTEM DROP  TABLE t_index_non_materialized;