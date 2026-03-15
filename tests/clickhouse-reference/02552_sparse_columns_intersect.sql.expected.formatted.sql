CREATE TABLE t_sparse_intersect
(
    a UInt64,
    c Int64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.8;

SELECT count()
FROM (
        SELECT *
        FROM t_sparse_intersect
EXCEPT
        SELECT *
        FROM t_sparse_intersect
    );

SELECT count()
FROM (
        SELECT *
        FROM t_sparse_intersect
INTERSECT
        SELECT *
        FROM t_sparse_intersect
    );