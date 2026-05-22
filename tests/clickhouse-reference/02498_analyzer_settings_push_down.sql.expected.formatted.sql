SET enable_analyzer = 1;

SET optimize_functions_to_subcolumns = 0;

DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value Tuple(a UInt64)
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table;

-- { echoOn }
SELECT value
FROM (
        SELECT tupleElement(value, 'a') AS value
        FROM test_table
    );

SELECT '--';

-- { echoOff }
DROP TABLE test_table;