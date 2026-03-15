SET deduplicate_blocks_in_dependent_materialized_views = 0;

CREATE TABLE test
(
    test String,
    A Int64,
    B Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
ORDER BY tuple();

CREATE MATERIALIZED VIEW test_mv_a
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
ORDER BY tuple()
AS
SELECT
    test,
    A,
    count() AS c
FROM test
GROUP BY
    test,
    A;

CREATE MATERIALIZED VIEW test_mv_b
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
ORDER BY tuple()
PARTITION BY A
AS
SELECT
    test,
    A,
    count() AS c
FROM test
GROUP BY
    test,
    A;

CREATE MATERIALIZED VIEW test_mv_c
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
ORDER BY tuple()
AS
SELECT
    test,
    A,
    count() AS c
FROM test
GROUP BY
    test,
    A;

SET max_partitions_per_insert_block = 1;

SET max_partitions_per_insert_block = 0;

SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case1'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case1'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case1'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case1'
    );

SET deduplicate_blocks_in_dependent_materialized_views = 1;

SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case2'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case2'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case2'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case2'
    );

SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case3'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case3'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case3'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case3'
    );

SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case4'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case4'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case4'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case4'
    );