CREATE TABLE t1
(
    c1 Int32,
    c2 Int32
)
ENGINE = MergeTree
ORDER BY c1;

CREATE TABLE t2
(
    c1 Int32,
    c2 Int32,
    c3 String
)
ENGINE = MergeTree
ORDER BY (c1, c2, c3);

SET enable_optimize_predicate_expression = 1;

SET enable_optimize_predicate_expression = 0;