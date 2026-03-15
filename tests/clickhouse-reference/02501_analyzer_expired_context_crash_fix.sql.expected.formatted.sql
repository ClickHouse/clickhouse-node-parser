SET enable_analyzer = 1;

CREATE TABLE test_table
(
    b Int64,
    a Int64,
    grp_aggreg AggregateFunction(groupArrayArray, Array(UInt64))
)
ENGINE = MergeTree()
ORDER BY a;

SELECT
    b,
    a,
    JSONLength(grp_aggreg, 100, NULL)
FROM test_table
SETTINGS optimize_aggregation_in_order = 1;