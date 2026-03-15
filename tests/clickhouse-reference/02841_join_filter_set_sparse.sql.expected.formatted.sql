CREATE TABLE t1
(
    s String
)
ENGINE = MergeTree
ORDER BY s
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.5;

CREATE TABLE t2
(
    s String
)
ENGINE = MergeTree
ORDER BY s
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.5;

SELECT countIf(ignore(*) == 0)
FROM
    t1
INNER JOIN t2
    ON t1.s = t2.s;

SET join_algorithm = 'full_sorting_merge', max_rows_in_set_to_optimize_join = 100000;