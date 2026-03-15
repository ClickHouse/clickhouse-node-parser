SET enable_analyzer = 1;

CREATE TABLE foo
(
    Id Int32,
    Val Int32
)
ENGINE = MergeTree
ORDER BY Id
PARTITION BY Val;

CREATE TABLE foo1
(
    Id Int32,
    Val Decimal32(9)
)
ENGINE = MergeTree
ORDER BY Id
PARTITION BY Val;

CREATE TABLE foo_merge AS foo
ENGINE = Merge(currentDatabase(), '^foo');

CREATE TABLE t2
(
    Id Int32,
    Val Int64,
    X UInt256
)
ENGINE = Memory;

SELECT `explain`
FROM (
        EXPLAIN
        SELECT count()
        FROM
            foo_merge
        INNER JOIN t2
            USING (Val)
        SETTINGS
            enable_join_runtime_filters = 1,
            parallel_replicas_local_plan = 1
    );

SELECT count()
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
SETTINGS enable_join_runtime_filters = 0;

SELECT count()
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
SETTINGS enable_join_runtime_filters = 1;