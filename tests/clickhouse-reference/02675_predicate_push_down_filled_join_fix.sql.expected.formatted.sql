SET enable_analyzer = 1;

SET single_join_prefer_left_table = 0;

SET optimize_move_to_prewhere = 0;

SET query_plan_optimize_join_order_limit = 0;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table;

CREATE TABLE test_table_join
(
    id UInt64,
    value String
)
ENGINE = Join(`All`, `inner`, id);

INSERT INTO test_table_join;

SELECT
    t1.id,
    t1.value,
    t2.value
FROM
    test_table AS t1
INNER JOIN test_table_join AS t2
    ON t1.id = t2.id
WHERE t1.id = 0;