SET enable_analyzer = 1;

SET allow_experimental_correlated_subqueries = 1;

SET enable_parallel_replicas = 0;

SET correlated_subqueries_substitute_equivalent_expressions = 1;

SET query_plan_join_swap_table = false;

SET correlated_subqueries_default_join_kind = 'left';

CREATE TABLE a
(
    c1 Int64,
    c2 Int64,
    c3 Int64,
    c4 Int64
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE b
(
    c1 Int64,
    c2 Int64,
    c3 Int64,
    c4 Int64
)
ENGINE = MergeTree()
ORDER BY tuple();