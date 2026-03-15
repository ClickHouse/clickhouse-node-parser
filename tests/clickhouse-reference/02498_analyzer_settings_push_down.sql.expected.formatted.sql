SET enable_analyzer = 1;

SET optimize_functions_to_subcolumns = 0;

CREATE TABLE test_table
(
    id UInt64,
    value Tuple(a UInt64)
)
ENGINE = MergeTree
ORDER BY id;

-- { echoOn }
SELECT value
FROM (
        SELECT tupleElement(value, 'a') AS value
        FROM test_table
    );

SELECT '--';