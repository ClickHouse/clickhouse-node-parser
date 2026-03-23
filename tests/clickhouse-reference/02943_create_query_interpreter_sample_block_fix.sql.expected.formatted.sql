CREATE TABLE test_table
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

CREATE MATERIALIZED VIEW test_mv
ENGINE = MergeTree
ORDER BY arr
AS
WITH (
        SELECT '\\d[a-z]'
    ) AS constant_value

SELECT extractAll(concat(toString(number), 'a'), assumeNotNull(constant_value)) AS arr
FROM test_table;

INSERT INTO test_table;

SELECT *
FROM test_mv
ORDER BY arr ASC;

SELECT '--';

INSERT INTO test_table;

CREATE TABLE regex_test_table
(
    regex String
)
ENGINE = MergeTree
ORDER BY regex;

INSERT INTO regex_test_table;

CREATE MATERIALIZED VIEW test_mv
ENGINE = MergeTree
ORDER BY arr
AS
WITH (
        SELECT regex
        FROM regex_test_table
    ) AS constant_value

SELECT extractAll(concat(toString(number), 'a'), assumeNotNull(constant_value)) AS arr
FROM test_table;