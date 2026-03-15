CREATE TABLE test1
(
    i int,
    j int
)
ENGINE = Log;

SELECT *
FROM
    (
        WITH test1 AS (
            SELECT toInt32(*) AS i
            FROM numbers(5)
        )

        SELECT *
        FROM test1
    ) AS l
INNER JOIN test1 AS r
    ON (l.i == r.i);

SELECT '---------------------------';

SET empty_result_for_aggregation_by_empty_set = 0;

CREATE TABLE with_test
ENGINE = Memory AS
SELECT CAST(number - 1 AS Nullable(Int64)) AS n
FROM numbers(10000);